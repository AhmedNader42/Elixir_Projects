defmodule Cards do
  @moduledoc """
    This module generates, shuffles and deals cards.
  """


  def create_deck() do
    numbers = ["Ace", "Two", "Three", "Four", "Five"]
    suits   = ["Spades", "Heart" , "Clubs", "Diamonds"]


    for suit <- suits, number <- numbers do
      "#{number} of #{suit}"
    end 
  end 

  def shuffle(deck) do
    Enum.shuffle(deck)
  end


  def contains?(deck, card) do
    Enum.member?(deck)
  end

  @doc """

    Divides the deck into a `hand_size` portion and the rest portion

    ## Example
      iex> deck = Cards.create_deck()
      iex> {hand, deck} = Cards.deal(deck, 1)
      iex> hand
      ["Ace of Spades"]        

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end 


  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write(filename, binary)
  end

  def load(filename) do 
    case File.read(filename) do
      {:ok, binary} -> :erlang.binary_to_term(binary)
      {:error, _reason} -> "This file ain't here"
    end 
  end


  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end 


end
