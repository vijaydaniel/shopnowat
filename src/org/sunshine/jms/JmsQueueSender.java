package org.sunshine.jms;

import javax.jms.ConnectionFactory;
import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Queue;
import javax.jms.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jms.core.MessageCreator;
import org.springframework.jms.core.JmsTemplate;
import org.springframework.stereotype.Service;
import org.sunshine.domain.ShoppingBasket;

@Service
public class JmsQueueSender {
	
    private JmsTemplate jmsTemplate;
	
    private Queue queue;

    public void setConnectionFactory(ConnectionFactory cf) {
        this.setJmsTemplate(new JmsTemplate(cf));
    }

    public void setQueue(Queue queue) {
        this.queue = queue;
    }

    public void simpleSend(final ShoppingBasket order) {
        this.getJmsTemplate().send(this.queue, new MessageCreator() {
            public Message createMessage(Session session) throws JMSException {
            	try{
            	System.out.println("session:"+session);
            	System.out.println(order);
                return session.createObjectMessage(order);
            	}catch(Exception e){
            		e.printStackTrace();
            	}
            	return null;
            }
        });
    }

	public JmsTemplate getJmsTemplate() {
		return jmsTemplate;
	}

	public void setJmsTemplate(JmsTemplate jmsTemplate) {
		this.jmsTemplate = jmsTemplate;
	}
}