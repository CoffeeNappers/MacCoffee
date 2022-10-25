.class public final Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;
.super Ljava/lang/Object;
.source "DefaultSentryClientFactory.java"

# interfaces
.implements Ljava/util/concurrent/ThreadFactory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lio/sentry/DefaultSentryClientFactory;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1c
    name = "DaemonThreadFactory"
.end annotation


# static fields
.field private static final POOL_NUMBER:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final group:Ljava/lang/ThreadGroup;

.field private final namePrefix:Ljava/lang/String;

.field private final priority:I

.field private final threadNumber:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 817
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    sput-object v0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->POOL_NUMBER:Ljava/util/concurrent/atomic/AtomicInteger;

    return-void
.end method

.method private constructor <init>(I)V
    .locals 3
    .param p1, "priority"    # I

    .prologue
    .line 823
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 819
    new-instance v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    iput-object v1, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->threadNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 824
    invoke-static {}, Ljava/lang/System;->getSecurityManager()Ljava/lang/SecurityManager;

    move-result-object v0

    .line 825
    .local v0, "s":Ljava/lang/SecurityManager;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/SecurityManager;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->group:Ljava/lang/ThreadGroup;

    .line 826
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "sentry-pool-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    sget-object v2, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->POOL_NUMBER:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "-thread-"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->namePrefix:Ljava/lang/String;

    .line 827
    iput p1, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->priority:I

    .line 828
    return-void

    .line 825
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getThreadGroup()Ljava/lang/ThreadGroup;

    move-result-object v1

    goto :goto_0
.end method

.method synthetic constructor <init>(ILio/sentry/DefaultSentryClientFactory$1;)V
    .locals 0
    .param p1, "x0"    # I
    .param p2, "x1"    # Lio/sentry/DefaultSentryClientFactory$1;

    .prologue
    .line 816
    invoke-direct {p0, p1}, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;-><init>(I)V

    return-void
.end method


# virtual methods
.method public newThread(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 6
    .param p1, "r"    # Ljava/lang/Runnable;

    .prologue
    .line 832
    new-instance v0, Ljava/lang/Thread;

    iget-object v1, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->group:Ljava/lang/ThreadGroup;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->namePrefix:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->threadNumber:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const-wide/16 v4, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Ljava/lang/Thread;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;J)V

    .line 833
    .local v0, "t":Ljava/lang/Thread;
    invoke-virtual {v0}, Ljava/lang/Thread;->isDaemon()Z

    move-result v1

    if-nez v1, :cond_0

    .line 834
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 836
    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->getPriority()I

    move-result v1

    iget v2, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->priority:I

    if-eq v1, v2, :cond_1

    .line 837
    iget v1, p0, Lio/sentry/DefaultSentryClientFactory$DaemonThreadFactory;->priority:I

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setPriority(I)V

    .line 839
    :cond_1
    return-object v0
.end method
