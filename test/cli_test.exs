defmodule CliTest do
  use ExUnit.case
  doctest Issues

  import issues.CLI, only: [parse_args: 1]

  test ":help returnd by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) == :help
    assert parse_args(["--help", "anything"]) == :help
  end

  test "three values returnd if three given" do
    assert parse_args(["user", "project", "99"]) == { "user", "project", 99 }
  end

  test "count is defaultd if two values given" do
    assert parse_args(["user", "project"]) == { "user", "project" , 4 }
  end
end
