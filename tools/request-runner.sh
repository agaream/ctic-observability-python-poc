TIMES=1000
ROUTES=("/" "/io_task" "/cpu_task" "/random_sleep" "/random_status" "/error_test" "/generator" "/processor" "/chain")
PORTS=("8000" "8001" "8002")
DEBUG=false

for i in $(seq 1 $TIMES); do
    ROUTE=${ROUTES[$RANDOM % ${#ROUTES[@]}]}
    PORT=${PORTS[$RANDOM % ${#PORTS[@]}]}

    if [ "$ROUTE" = "/generator" ]; then
        FULL_ROUTE="/generator/message-$i"
    else
        FULL_ROUTE="$ROUTE"
    fi

    if [ "$DEBUG" = true ]; then
        echo "Requesting: http://localhost:$PORT$FULL_ROUTE"
        curl -w "\nStatus: %{http_code}\n" "http://localhost:$PORT$FULL_ROUTE"
    else
        curl -s -o /dev/null -w "%{http_code}\n" "http://localhost:$PORT$FULL_ROUTE" &
    fi

    [ $((RANDOM % 3)) -eq 0 ] && wait
done

wait
