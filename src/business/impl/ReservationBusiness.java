package business.impl;


import business.inter.IReservationBusiness;
import entity.Order.OrderState;

public class ReservationBusiness extends NewOrderBusiness implements IReservationBusiness {


	@Override
	public OrderState getSubmitOrderState() {
		return OrderState.reservation_generate;
	}

	@Override
	public boolean confirmReservation() {
		/* Change the state to reservation_confirm */
		order.setOrderState(OrderState.reservation_confirm);
		boolean modified = orderManager.modifyOrder(order);
		return modified;
	}

}
