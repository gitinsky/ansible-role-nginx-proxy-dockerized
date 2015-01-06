Eye.application 'nginx' do
  working_dir '/'
  stdall '/var/log/eye/nginx-stdall.log' # stdout,err logs for processes by default
  trigger :flapping, times: 10, within: 1.minute, retry_in: 3.minutes
  check :cpu, every: 10.seconds, below: 100, times: 3 # global check for all processes

  process :nginx do
    pid_file '/var/run/nginx.pid'
    start_command 'bash -c "ulimit -n 4096 && /etc/init.d/nginx start"'

    start_timeout 10.seconds
    stop_timeout 5.seconds

  end

end
