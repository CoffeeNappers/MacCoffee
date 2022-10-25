package io.sentry;

import com.facebook.common.util.UriUtil;
import io.sentry.buffer.Buffer;
import io.sentry.buffer.DiskBuffer;
import io.sentry.config.Lookup;
import io.sentry.connection.AsyncConnection;
import io.sentry.connection.BufferedConnection;
import io.sentry.connection.Connection;
import io.sentry.connection.EventSampler;
import io.sentry.connection.HttpConnection;
import io.sentry.connection.NoopConnection;
import io.sentry.connection.OutputStreamConnection;
import io.sentry.connection.ProxyAuthenticator;
import io.sentry.connection.RandomEventSampler;
import io.sentry.context.ContextManager;
import io.sentry.context.ThreadLocalContextManager;
import io.sentry.dsn.Dsn;
import io.sentry.event.helper.ContextBuilderHelper;
import io.sentry.event.helper.HttpEventBuilderHelper;
import io.sentry.event.interfaces.ExceptionInterface;
import io.sentry.event.interfaces.HttpInterface;
import io.sentry.event.interfaces.MessageInterface;
import io.sentry.event.interfaces.StackTraceInterface;
import io.sentry.event.interfaces.UserInterface;
import io.sentry.marshaller.Marshaller;
import io.sentry.marshaller.json.ExceptionInterfaceBinding;
import io.sentry.marshaller.json.HttpInterfaceBinding;
import io.sentry.marshaller.json.JsonMarshaller;
import io.sentry.marshaller.json.MessageInterfaceBinding;
import io.sentry.marshaller.json.StackTraceInterfaceBinding;
import io.sentry.marshaller.json.UserInterfaceBinding;
import io.sentry.util.Util;
import java.io.File;
import java.net.Authenticator;
import java.net.InetSocketAddress;
import java.net.Proxy;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.BlockingDeque;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.LinkedBlockingDeque;
import java.util.concurrent.RejectedExecutionHandler;
import java.util.concurrent.ThreadFactory;
import java.util.concurrent.ThreadPoolExecutor;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.atomic.AtomicInteger;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
/* loaded from: classes3.dex */
public class DefaultSentryClientFactory extends SentryClientFactory {
    public static final String ASYNC_GRACEFUL_SHUTDOWN_OPTION = "async.gracefulshutdown";
    public static final String ASYNC_OPTION = "async";
    public static final String ASYNC_PRIORITY_OPTION = "async.priority";
    public static final String ASYNC_QUEUE_DISCARDNEW = "discardnew";
    public static final String ASYNC_QUEUE_DISCARDOLD = "discardold";
    public static final String ASYNC_QUEUE_OVERFLOW_DEFAULT = "discardold";
    public static final String ASYNC_QUEUE_OVERFLOW_OPTION = "async.queue.overflow";
    public static final String ASYNC_QUEUE_SIZE_OPTION = "async.queuesize";
    public static final String ASYNC_QUEUE_SYNC = "sync";
    public static final String ASYNC_SHUTDOWN_TIMEOUT_OPTION = "async.shutdowntimeout";
    public static final String ASYNC_THREADS_OPTION = "async.threads";
    public static final String BUFFER_DIR_OPTION = "buffer.dir";
    public static final boolean BUFFER_ENABLED_DEFAULT = true;
    public static final String BUFFER_ENABLED_OPTION = "buffer.enabled";
    public static final long BUFFER_FLUSHTIME_DEFAULT = 60000;
    public static final String BUFFER_FLUSHTIME_OPTION = "buffer.flushtime";
    public static final String BUFFER_GRACEFUL_SHUTDOWN_OPTION = "buffer.gracefulshutdown";
    public static final String BUFFER_SHUTDOWN_TIMEOUT_OPTION = "buffer.shutdowntimeout";
    public static final int BUFFER_SIZE_DEFAULT = 50;
    public static final String BUFFER_SIZE_OPTION = "buffer.size";
    public static final String COMPRESSION_OPTION = "compression";
    public static final String DIST_OPTION = "dist";
    public static final String ENVIRONMENT_OPTION = "environment";
    public static final String EXTRATAGS_OPTION = "extratags";
    public static final String HIDE_COMMON_FRAMES_OPTION = "stacktrace.hidecommon";
    public static final String HTTP_PROXY_HOST_OPTION = "http.proxy.host";
    public static final String HTTP_PROXY_PASS_OPTION = "http.proxy.password";
    public static final int HTTP_PROXY_PORT_DEFAULT = 80;
    public static final String HTTP_PROXY_PORT_OPTION = "http.proxy.port";
    public static final String HTTP_PROXY_USER_OPTION = "http.proxy.user";
    public static final String IN_APP_FRAMES_OPTION = "stacktrace.app.packages";
    public static final String MAX_MESSAGE_LENGTH_OPTION = "maxmessagelength";
    public static final String NAIVE_PROTOCOL = "naive";
    public static final int QUEUE_SIZE_DEFAULT = 50;
    public static final String RELEASE_OPTION = "release";
    public static final String SAMPLE_RATE_OPTION = "sample.rate";
    public static final String SERVERNAME_OPTION = "servername";
    public static final String TAGS_OPTION = "tags";
    public static final String TIMEOUT_OPTION = "timeout";
    public static final int TIMEOUT_DEFAULT = (int) TimeUnit.SECONDS.toMillis(1);
    public static final long BUFFER_SHUTDOWN_TIMEOUT_DEFAULT = TimeUnit.SECONDS.toMillis(1);
    public static final long ASYNC_SHUTDOWN_TIMEOUT_DEFAULT = TimeUnit.SECONDS.toMillis(1);
    private static final Logger logger = LoggerFactory.getLogger(DefaultSentryClientFactory.class);
    private static final String FALSE = Boolean.FALSE.toString();
    private static final Map<String, RejectedExecutionHandler> REJECT_EXECUTION_HANDLERS = new HashMap();

    static {
        REJECT_EXECUTION_HANDLERS.put("sync", new ThreadPoolExecutor.CallerRunsPolicy());
        REJECT_EXECUTION_HANDLERS.put(ASYNC_QUEUE_DISCARDNEW, new ThreadPoolExecutor.DiscardPolicy());
        REJECT_EXECUTION_HANDLERS.put("discardold", new ThreadPoolExecutor.DiscardOldestPolicy());
    }

    @Override // io.sentry.SentryClientFactory
    public SentryClient createSentryClient(Dsn dsn) {
        SentryClient sentryClient = new SentryClient(createConnection(dsn), getContextManager(dsn));
        try {
            Class.forName("javax.servlet.ServletRequestListener", false, getClass().getClassLoader());
            sentryClient.addBuilderHelper(new HttpEventBuilderHelper());
        } catch (ClassNotFoundException e) {
            logger.debug("The current environment doesn't provide access to servlets, or provides an unsupported version.");
        }
        sentryClient.addBuilderHelper(new ContextBuilderHelper(sentryClient));
        return configureSentryClient(sentryClient, dsn);
    }

    protected SentryClient configureSentryClient(SentryClient sentryClient, Dsn dsn) {
        String release = getRelease(dsn);
        if (release != null) {
            sentryClient.setRelease(release);
        }
        String dist = getDist(dsn);
        if (dist != null) {
            sentryClient.setDist(dist);
        }
        String environment = getEnvironment(dsn);
        if (environment != null) {
            sentryClient.setEnvironment(environment);
        }
        String serverName = getServerName(dsn);
        if (serverName != null) {
            sentryClient.setServerName(serverName);
        }
        Map<String, String> tags = getTags(dsn);
        if (!tags.isEmpty()) {
            for (Map.Entry<String, String> tagEntry : tags.entrySet()) {
                sentryClient.addTag(tagEntry.getKey(), tagEntry.getValue());
            }
        }
        Set<String> extraTags = getExtraTags(dsn);
        if (!extraTags.isEmpty()) {
            for (String extraTag : extraTags) {
                sentryClient.addExtraTag(extraTag);
            }
        }
        return sentryClient;
    }

    protected Connection createConnection(Dsn dsn) {
        Connection connection;
        Buffer eventBuffer;
        String protocol = dsn.getProtocol();
        if (protocol.equalsIgnoreCase(UriUtil.HTTP_SCHEME) || protocol.equalsIgnoreCase(UriUtil.HTTPS_SCHEME)) {
            logger.info("Using an {} connection to Sentry.", protocol.toUpperCase());
            connection = createHttpConnection(dsn);
        } else if (protocol.equalsIgnoreCase("out")) {
            logger.info("Using StdOut to send events.");
            connection = createStdOutConnection(dsn);
        } else if (protocol.equalsIgnoreCase("noop")) {
            logger.info("Using noop to send events.");
            connection = new NoopConnection();
        } else {
            throw new IllegalStateException("Couldn't create a connection for the protocol '" + protocol + "'");
        }
        BufferedConnection bufferedConnection = null;
        if (getBufferEnabled(dsn) && (eventBuffer = getBuffer(dsn)) != null) {
            long flushtime = getBufferFlushtime(dsn);
            boolean gracefulShutdown = getBufferedConnectionGracefulShutdownEnabled(dsn);
            Long shutdownTimeout = Long.valueOf(getBufferedConnectionShutdownTimeout(dsn));
            bufferedConnection = new BufferedConnection(connection, eventBuffer, flushtime, gracefulShutdown, shutdownTimeout.longValue());
            connection = bufferedConnection;
        }
        if (getAsyncEnabled(dsn)) {
            connection = createAsyncConnection(dsn, connection);
        }
        if (bufferedConnection != null) {
            return bufferedConnection.wrapConnectionWithBufferWriter(connection);
        }
        return connection;
    }

    protected Connection createAsyncConnection(Dsn dsn, Connection connection) {
        BlockingDeque<Runnable> queue;
        int maxThreads = getAsyncThreads(dsn);
        int priority = getAsyncPriority(dsn);
        int queueSize = getAsyncQueueSize(dsn);
        if (queueSize == -1) {
            queue = new LinkedBlockingDeque<>();
        } else {
            queue = new LinkedBlockingDeque<>(queueSize);
        }
        ExecutorService executorService = new ThreadPoolExecutor(maxThreads, maxThreads, 0L, TimeUnit.MILLISECONDS, queue, new DaemonThreadFactory(priority), getRejectedExecutionHandler(dsn));
        boolean gracefulShutdown = getAsyncGracefulShutdownEnabled(dsn);
        long shutdownTimeout = getAsyncShutdownTimeout(dsn);
        return new AsyncConnection(connection, executorService, gracefulShutdown, shutdownTimeout);
    }

    protected Connection createHttpConnection(Dsn dsn) {
        URL sentryApiUrl = HttpConnection.getSentryApiUrl(dsn.getUri(), dsn.getProjectId());
        String proxyHost = getProxyHost(dsn);
        String proxyUser = getProxyUser(dsn);
        String proxyPass = getProxyPass(dsn);
        int proxyPort = getProxyPort(dsn);
        Proxy proxy = null;
        if (proxyHost != null) {
            InetSocketAddress proxyAddr = new InetSocketAddress(proxyHost, proxyPort);
            proxy = new Proxy(Proxy.Type.HTTP, proxyAddr);
            if (proxyUser != null && proxyPass != null) {
                Authenticator.setDefault(new ProxyAuthenticator(proxyUser, proxyPass));
            }
        }
        Double sampleRate = getSampleRate(dsn);
        EventSampler eventSampler = null;
        if (sampleRate != null) {
            eventSampler = new RandomEventSampler(sampleRate.doubleValue());
        }
        HttpConnection httpConnection = new HttpConnection(sentryApiUrl, dsn.getPublicKey(), dsn.getSecretKey(), proxy, eventSampler);
        Marshaller marshaller = createMarshaller(dsn);
        httpConnection.setMarshaller(marshaller);
        int timeout = getTimeout(dsn);
        httpConnection.setTimeout(timeout);
        boolean bypassSecurityEnabled = getBypassSecurityEnabled(dsn);
        httpConnection.setBypassSecurity(bypassSecurityEnabled);
        return httpConnection;
    }

    protected Connection createStdOutConnection(Dsn dsn) {
        OutputStreamConnection stdOutConnection = new OutputStreamConnection(System.out);
        stdOutConnection.setMarshaller(createMarshaller(dsn));
        return stdOutConnection;
    }

    protected Marshaller createMarshaller(Dsn dsn) {
        int maxMessageLength = getMaxMessageLength(dsn);
        JsonMarshaller marshaller = new JsonMarshaller(maxMessageLength);
        StackTraceInterfaceBinding stackTraceBinding = new StackTraceInterfaceBinding();
        stackTraceBinding.setRemoveCommonFramesWithEnclosing(getHideCommonFramesEnabled(dsn));
        stackTraceBinding.setInAppFrames(getInAppFrames(dsn));
        marshaller.addInterfaceBinding(StackTraceInterface.class, stackTraceBinding);
        marshaller.addInterfaceBinding(ExceptionInterface.class, new ExceptionInterfaceBinding(stackTraceBinding));
        marshaller.addInterfaceBinding(MessageInterface.class, new MessageInterfaceBinding(maxMessageLength));
        marshaller.addInterfaceBinding(UserInterface.class, new UserInterfaceBinding());
        HttpInterfaceBinding httpBinding = new HttpInterfaceBinding();
        marshaller.addInterfaceBinding(HttpInterface.class, httpBinding);
        marshaller.setCompression(getCompressionEnabled(dsn));
        return marshaller;
    }

    protected ContextManager getContextManager(Dsn dsn) {
        return new ThreadLocalContextManager();
    }

    protected Collection<String> getInAppFrames(Dsn dsn) {
        String inAppFramesOption = Lookup.lookup(IN_APP_FRAMES_OPTION, dsn);
        if (Util.isNullOrEmpty(inAppFramesOption)) {
            return Collections.emptyList();
        }
        ArrayList<String> inAppPackages = new ArrayList<>();
        String[] arr$ = inAppFramesOption.split(",");
        for (String inAppPackage : arr$) {
            if (!inAppPackage.trim().equals("")) {
                inAppPackages.add(inAppPackage);
            }
        }
        return inAppPackages;
    }

    protected boolean getAsyncEnabled(Dsn dsn) {
        return !FALSE.equalsIgnoreCase(Lookup.lookup(ASYNC_OPTION, dsn));
    }

    protected RejectedExecutionHandler getRejectedExecutionHandler(Dsn dsn) {
        String overflowName = "discardold";
        String asyncQueueOverflowOption = Lookup.lookup(ASYNC_QUEUE_OVERFLOW_OPTION, dsn);
        if (!Util.isNullOrEmpty(asyncQueueOverflowOption)) {
            overflowName = asyncQueueOverflowOption.toLowerCase();
        }
        RejectedExecutionHandler handler = REJECT_EXECUTION_HANDLERS.get(overflowName);
        if (handler == null) {
            String options = Arrays.toString(REJECT_EXECUTION_HANDLERS.keySet().toArray());
            throw new RuntimeException("RejectedExecutionHandler not found: '" + overflowName + "', valid choices are: " + options);
        }
        return handler;
    }

    protected long getBufferedConnectionShutdownTimeout(Dsn dsn) {
        return Util.parseLong(Lookup.lookup(BUFFER_SHUTDOWN_TIMEOUT_OPTION, dsn), Long.valueOf(BUFFER_SHUTDOWN_TIMEOUT_DEFAULT)).longValue();
    }

    protected boolean getBufferedConnectionGracefulShutdownEnabled(Dsn dsn) {
        return !FALSE.equalsIgnoreCase(Lookup.lookup(BUFFER_GRACEFUL_SHUTDOWN_OPTION, dsn));
    }

    protected long getBufferFlushtime(Dsn dsn) {
        return Util.parseLong(Lookup.lookup(BUFFER_FLUSHTIME_OPTION, dsn), 60000L).longValue();
    }

    protected long getAsyncShutdownTimeout(Dsn dsn) {
        return Util.parseLong(Lookup.lookup(ASYNC_SHUTDOWN_TIMEOUT_OPTION, dsn), Long.valueOf(ASYNC_SHUTDOWN_TIMEOUT_DEFAULT)).longValue();
    }

    protected boolean getAsyncGracefulShutdownEnabled(Dsn dsn) {
        return !FALSE.equalsIgnoreCase(Lookup.lookup(ASYNC_GRACEFUL_SHUTDOWN_OPTION, dsn));
    }

    protected int getAsyncQueueSize(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(ASYNC_QUEUE_SIZE_OPTION, dsn), 50).intValue();
    }

    protected int getAsyncPriority(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(ASYNC_PRIORITY_OPTION, dsn), 1).intValue();
    }

    protected int getAsyncThreads(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(ASYNC_THREADS_OPTION, dsn), Integer.valueOf(Runtime.getRuntime().availableProcessors())).intValue();
    }

    protected boolean getBypassSecurityEnabled(Dsn dsn) {
        return dsn.getProtocolSettings().contains(NAIVE_PROTOCOL);
    }

    protected Double getSampleRate(Dsn dsn) {
        return Util.parseDouble(Lookup.lookup(SAMPLE_RATE_OPTION, dsn), null);
    }

    protected int getProxyPort(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(HTTP_PROXY_PORT_OPTION, dsn), 80).intValue();
    }

    protected String getProxyHost(Dsn dsn) {
        return Lookup.lookup(HTTP_PROXY_HOST_OPTION, dsn);
    }

    protected String getProxyUser(Dsn dsn) {
        return Lookup.lookup(HTTP_PROXY_USER_OPTION, dsn);
    }

    protected String getProxyPass(Dsn dsn) {
        return Lookup.lookup(HTTP_PROXY_PASS_OPTION, dsn);
    }

    protected String getRelease(Dsn dsn) {
        return Lookup.lookup("release", dsn);
    }

    protected String getDist(Dsn dsn) {
        return Lookup.lookup("dist", dsn);
    }

    protected String getEnvironment(Dsn dsn) {
        return Lookup.lookup("environment", dsn);
    }

    protected String getServerName(Dsn dsn) {
        return Lookup.lookup(SERVERNAME_OPTION, dsn);
    }

    protected Map<String, String> getTags(Dsn dsn) {
        return Util.parseTags(Lookup.lookup("tags", dsn));
    }

    protected Set<String> getExtraTags(Dsn dsn) {
        return Util.parseExtraTags(Lookup.lookup(EXTRATAGS_OPTION, dsn));
    }

    protected boolean getCompressionEnabled(Dsn dsn) {
        return !FALSE.equalsIgnoreCase(Lookup.lookup(COMPRESSION_OPTION, dsn));
    }

    protected boolean getHideCommonFramesEnabled(Dsn dsn) {
        return !FALSE.equalsIgnoreCase(Lookup.lookup(HIDE_COMMON_FRAMES_OPTION, dsn));
    }

    protected int getMaxMessageLength(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(MAX_MESSAGE_LENGTH_OPTION, dsn), 1000).intValue();
    }

    protected int getTimeout(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(TIMEOUT_OPTION, dsn), Integer.valueOf(TIMEOUT_DEFAULT)).intValue();
    }

    protected boolean getBufferEnabled(Dsn dsn) {
        String bufferEnabled = Lookup.lookup(BUFFER_ENABLED_OPTION, dsn);
        if (bufferEnabled != null) {
            return Boolean.parseBoolean(bufferEnabled);
        }
        return true;
    }

    protected Buffer getBuffer(Dsn dsn) {
        String bufferDir = Lookup.lookup(BUFFER_DIR_OPTION, dsn);
        if (bufferDir != null) {
            return new DiskBuffer(new File(bufferDir), getBufferSize(dsn));
        }
        return null;
    }

    /* JADX INFO: Access modifiers changed from: protected */
    public int getBufferSize(Dsn dsn) {
        return Util.parseInteger(Lookup.lookup(BUFFER_SIZE_OPTION, dsn), 50).intValue();
    }

    /* JADX INFO: Access modifiers changed from: protected */
    /* loaded from: classes3.dex */
    public static final class DaemonThreadFactory implements ThreadFactory {
        private static final AtomicInteger POOL_NUMBER = new AtomicInteger(1);
        private final ThreadGroup group;
        private final String namePrefix;
        private final int priority;
        private final AtomicInteger threadNumber;

        private DaemonThreadFactory(int priority) {
            this.threadNumber = new AtomicInteger(1);
            SecurityManager s = System.getSecurityManager();
            this.group = s != null ? s.getThreadGroup() : Thread.currentThread().getThreadGroup();
            this.namePrefix = "sentry-pool-" + POOL_NUMBER.getAndIncrement() + "-thread-";
            this.priority = priority;
        }

        @Override // java.util.concurrent.ThreadFactory
        public Thread newThread(Runnable r) {
            Thread t = new Thread(this.group, r, this.namePrefix + this.threadNumber.getAndIncrement(), 0L);
            if (!t.isDaemon()) {
                t.setDaemon(true);
            }
            if (t.getPriority() != this.priority) {
                t.setPriority(this.priority);
            }
            return t;
        }
    }
}
