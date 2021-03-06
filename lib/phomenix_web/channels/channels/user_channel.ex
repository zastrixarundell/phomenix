defmodule PhomenixWeb.UserChannel do
  use Phoenix.Channel

  def join("user:" <> _controller_name, _payload, socket) do
    {:ok, socket}
  end

  def handle_in("button:press", %{"code" => code, "id" => id}, socket) do
    PhomenixWeb.ControllerChannel.send_ir_to_controller(id, code)
    {:noreply, socket}
  end

  def handle_in("ac:send", %{"id" => id, "payload" => payload}, socket) do
    PhomenixWeb.ControllerChannel.send_ac_to_controller(id, payload)
    {:noreply, socket}
  end
end
