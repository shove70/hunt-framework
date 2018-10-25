/*
 * Copyright 2002-2015 the original author or authors.
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

module hunt.framework.messaging.simp.stomp;

import hunt.framework.messaging.tcp.TcpConnectionHandler;
import hunt.framework.util.concurrent.ListenableFuture;

/**
 * A {@link StompSession} that implements
 * {@link hunt.framework.messaging.tcp.TcpConnectionHandler
 * TcpConnectionHandler} in order to send and receive messages.
 *
 * <p>A ConnectionHandlingStompSession can be used with any TCP or WebSocket
 * library that is adapted to the {@code TcpConnectionHandler} contract.
 *
 * @author Rossen Stoyanchev
 * @since 4.2
 */
interface ConnectionHandlingStompSession extends StompSession, TcpConnectionHandler!(byte[]) {

	/**
	 * Return a future that will complete when the session is ready for use.
	 */
	ListenableFuture!(StompSession) getSessionFuture();

}
