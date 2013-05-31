Facter.add(:os_lower) do
  v = Facter.value(:operatingsystem)
  setcode do
    v.downcase
  end
end