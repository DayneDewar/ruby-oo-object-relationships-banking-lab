require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if self.status == 'pending'
      sender.balance -= self.amount
      receiver.balance += self.amount
      self.status = 'complete'
    else
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if status == 'complete'
        receiver.balance -= amount
        sender.balance += amount
        self.status = 'reversed'
    end
  end
end
