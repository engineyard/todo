#!/bin/bash
psql -U postgres -c "SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE state = 'idle in transaction'
  AND state_change < current_timestamp - INTERVAL '1' MINUTE"
