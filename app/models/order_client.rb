class OrderClient < ApplicationRecord
	enum status: { waiting: "Em espera", accepted: "Aceito", reject: "Rejeitado" }
end
