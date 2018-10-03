# used to call java code
require 'java'

# 'java_import' is used to import java classes
java_import 'java.util.concurrent.Callable'
java_import 'java.util.concurrent.FutureTask'
java_import 'java.util.concurrent.LinkedBlockingQueue'
java_import 'java.util.concurrent.ThreadPoolExecutor'
java_import 'java.util.concurrent.TimeUnit'

# Implement a callable class
class CountMillion
  include Callable
  def call
    count = 0
    1000000.times do
      count += 1
    end
  end
end

# Create a thread pool
executor = ThreadPoolExecutor.new(4, # core_pool_treads
                                  4, # max_pool_threads
                                  60, # keep_alive_time
                                  TimeUnit::SECONDS,
                                  LinkedBlockingQueue.new)

# Try counting to 1 million on 4 separate threads 20 times
num_tests = 20
num_threads = 4
total_time = 0.0

num_tests.times do |i|
  tasks = []

  t_0 = Time.now
  num_threads.times do
    task = FutureTask.new(CountMillion.new)
    executor.execute(task)
    tasks << task
  end

  # Wait for all threads to complete
  tasks.each do |t|
    t.get
  end
  t_1 = Time.now

  time_ms = (t_1-t_0) * 1000.0
  puts "TEST #{i}: Time elapsed = #{time_ms}ms"
  total_time +=  time_ms
end
executor.shutdown()

puts "Average completion time: #{total_time/num_tests}"
