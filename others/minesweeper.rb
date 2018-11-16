def minefield(field, cell)
  queue = []
  row, col = cell
  
  if field[row][col] == 0
    queue << cell
  elsif field[row][col] == -1
    return "Boom!!"
  else
    return field
  end

  while queue.size > 0
    current_i, current_j = queue.shift
    (current_i - 1).upto(current_i + 1) do |i|
      (current_j - 1).upto(current_j + 1) do |j|
        if i >= 0 && i < field.size && j >= 0 && j < field[0].size
          if field[i][j] == 0
            queue << [i,j]
            field[i][j] = -2
          end
        end
      end
    end
  end
  field
end