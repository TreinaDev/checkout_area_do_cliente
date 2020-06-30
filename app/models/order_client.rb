class OrderClient < ApplicationRecord
	enum status: { waiting: 0, approved: 1, rejected: 2 }
end
