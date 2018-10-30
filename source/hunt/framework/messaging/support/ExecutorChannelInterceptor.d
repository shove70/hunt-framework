/*
 * Copyright 2002-2018 the original author or authors.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module hunt.framework.messaging.support.ExecutorChannelInterceptor;

import hunt.framework.messaging.support.ChannelInterceptor;
import hunt.framework.messaging.Message;
import hunt.framework.messaging.MessageChannel;

/**
 * An extension of {@link ChannelInterceptor} with callbacks to intercept the
 * asynchronous sending of a {@link hunt.framework.messaging.Message} to
 * a specific subscriber through an {@link java.util.concurrent.Executor}.
 * Supported on {@link hunt.framework.messaging.MessageChannel}
 * implementations that can be configured with an {@code Executor}.
 *
 * @author Rossen Stoyanchev
 * @since 4.1
 * @see Message
 * @see MessageChannel
 * @see MessageHandler
 */
abstract class ExecutorChannelInterceptor : ChannelInterceptor {

	/**
	 * Invoked inside the {@link Runnable} submitted to the Executor just before
	 * calling the target MessageHandler to handle the message. Allows for
	 * modification of the Message if necessary or when {@code null} is returned
	 * the MessageHandler is not invoked.
	 * @param message the message to be handled
	 * @param channel the channel on which the message was sent to
	 * @param handler the target handler to handle the message
	 * @return the input message, or a new instance, or {@code null}
	 */
	
	MessageBase beforeHandle(MessageBase message, MessageChannel channel, MessageHandler handler) {
		return message;
	}

	/**
	 * Invoked inside the {@link Runnable} submitted to the Executor after calling
	 * the target MessageHandler regardless of the outcome (i.e. Exception raised
	 * or not) thus allowing for proper resource cleanup.
	 * <p>Note that this will be invoked only if beforeHandle successfully completed
	 * and returned a Message, i.e. it did not return {@code null}.
	 * @param message the message handled
	 * @param channel the channel on which the message was sent to
	 * @param handler the target handler that handled the message
	 * @param ex any exception that may been raised by the handler
	 */
	void afterMessageHandled(MessageBase message, MessageChannel channel, MessageHandler handler,
			Exception ex) {
	}

}
