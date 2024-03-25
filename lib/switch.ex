defmodule Switch do
  use GenStateMachine, callback_mode: [:handle_event_function, :state_enter]

  def handle_event(:enter, _event, state, data) do
    {:next_state, state, %{data | enters: data.enters + 1}}
  end

  def handle_event(:cast, :flip, :off, data) do
    {:next_state, :on, %{data | flips: data.flips + 1}}
  end

  def handle_event(:cast, :flip, :on, data) do
    {:next_state, :off, data}
  end

  def handle_event({:call, from}, :get_count, _state, data) do
    {:keep_state_and_data, [{:reply, from, data}]}
  end
end
