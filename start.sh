until ./crashnt.py; do
    echo "***Bot 'crashnt' crashed with exit code $?.  Respawning.." >&2
    sleep 2
done
