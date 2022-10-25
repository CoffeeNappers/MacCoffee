.class public final Lio/sentry/event/interfaces/SentryException;
.super Ljava/lang/Object;
.source "SentryException.java"

# interfaces
.implements Ljava/io/Serializable;


# static fields
.field public static final DEFAULT_PACKAGE_NAME:Ljava/lang/String; = "(default)"


# instance fields
.field private final exceptionClassName:Ljava/lang/String;

.field private final exceptionMessage:Ljava/lang/String;

.field private final exceptionPackageName:Ljava/lang/String;

.field private final stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lio/sentry/event/interfaces/StackTraceInterface;)V
    .locals 0
    .param p1, "exceptionMessage"    # Ljava/lang/String;
    .param p2, "exceptionClassName"    # Ljava/lang/String;
    .param p3, "exceptionPackageName"    # Ljava/lang/String;
    .param p4, "stackTraceInterface"    # Lio/sentry/event/interfaces/StackTraceInterface;

    .prologue
    .line 53
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    iput-object p1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    .line 55
    iput-object p2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    .line 56
    iput-object p3, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    .line 57
    iput-object p4, p0, Lio/sentry/event/interfaces/SentryException;->stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;

    .line 58
    return-void
.end method

.method public constructor <init>(Ljava/lang/Throwable;[Ljava/lang/StackTraceElement;)V
    .locals 4
    .param p1, "throwable"    # Ljava/lang/Throwable;
    .param p2, "childExceptionStackTrace"    # [Ljava/lang/StackTraceElement;

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 34
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    .line 35
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    .line 36
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getPackage()Ljava/lang/Package;

    move-result-object v0

    .line 37
    .local v0, "exceptionPackage":Ljava/lang/Package;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Package;->getName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    iput-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    .line 38
    new-instance v1, Lio/sentry/event/interfaces/StackTraceInterface;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v2

    invoke-static {p1}, Lio/sentry/jvmti/FrameCache;->get(Ljava/lang/Throwable;)[Lio/sentry/jvmti/Frame;

    move-result-object v3

    invoke-direct {v1, v2, p2, v3}, Lio/sentry/event/interfaces/StackTraceInterface;-><init>([Ljava/lang/StackTraceElement;[Ljava/lang/StackTraceElement;[Lio/sentry/jvmti/Frame;)V

    iput-object v1, p0, Lio/sentry/event/interfaces/SentryException;->stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;

    .line 40
    return-void

    .line 37
    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public static extractExceptionQueue(Ljava/lang/Throwable;)Ljava/util/Deque;
    .locals 4
    .param p0, "throwable"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Throwable;",
            ")",
            "Ljava/util/Deque",
            "<",
            "Lio/sentry/event/interfaces/SentryException;",
            ">;"
        }
    .end annotation

    .prologue
    .line 69
    new-instance v2, Ljava/util/ArrayDeque;

    invoke-direct {v2}, Ljava/util/ArrayDeque;-><init>()V

    .line 70
    .local v2, "exceptions":Ljava/util/Deque;, "Ljava/util/Deque<Lio/sentry/event/interfaces/SentryException;>;"
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 71
    .local v1, "circularityDetector":Ljava/util/Set;, "Ljava/util/Set<Ljava/lang/Throwable;>;"
    const/4 v3, 0x0

    new-array v0, v3, [Ljava/lang/StackTraceElement;

    .line 74
    .local v0, "childExceptionStackTrace":[Ljava/lang/StackTraceElement;
    :goto_0
    if-eqz p0, :cond_0

    invoke-interface {v1, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 75
    new-instance v3, Lio/sentry/event/interfaces/SentryException;

    invoke-direct {v3, p0, v0}, Lio/sentry/event/interfaces/SentryException;-><init>(Ljava/lang/Throwable;[Ljava/lang/StackTraceElement;)V

    invoke-interface {v2, v3}, Ljava/util/Deque;->add(Ljava/lang/Object;)Z

    .line 76
    invoke-virtual {p0}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 77
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    .line 80
    :cond_0
    return-object v2
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    const/4 v1, 0x0

    .line 118
    if-ne p0, p1, :cond_1

    .line 119
    const/4 v1, 0x1

    .line 139
    :cond_0
    :goto_0
    return v1

    .line 121
    :cond_1
    if-eqz p1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    if-ne v2, v3, :cond_0

    move-object v0, p1

    .line 125
    check-cast v0, Lio/sentry/event/interfaces/SentryException;

    .line 127
    .local v0, "that":Lio/sentry/event/interfaces/SentryException;
    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    iget-object v3, v0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 130
    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    if-eqz v2, :cond_4

    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    iget-object v3, v0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 134
    :cond_2
    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    if-eqz v2, :cond_5

    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    iget-object v3, v0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 139
    :cond_3
    iget-object v1, p0, Lio/sentry/event/interfaces/SentryException;->stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;

    iget-object v2, v0, Lio/sentry/event/interfaces/SentryException;->stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;

    invoke-virtual {v1, v2}, Lio/sentry/event/interfaces/StackTraceInterface;->equals(Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0

    .line 130
    :cond_4
    iget-object v2, v0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    if-eqz v2, :cond_2

    goto :goto_0

    .line 134
    :cond_5
    iget-object v2, v0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    if-eqz v2, :cond_3

    goto :goto_0
.end method

.method public getExceptionClassName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 88
    iget-object v0, p0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    return-object v0
.end method

.method public getExceptionMessage()Ljava/lang/String;
    .locals 1

    .prologue
    .line 84
    iget-object v0, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    return-object v0
.end method

.method public getExceptionPackageName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 99
    iget-object v0, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_0
    const-string/jumbo v0, "(default)"

    goto :goto_0
.end method

.method public getStackTraceInterface()Lio/sentry/event/interfaces/StackTraceInterface;
    .locals 1

    .prologue
    .line 103
    iget-object v0, p0, Lio/sentry/event/interfaces/SentryException;->stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;

    return-object v0
.end method

.method public hashCode()I
    .locals 4

    .prologue
    const/4 v1, 0x0

    .line 144
    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    if-eqz v2, :cond_1

    iget-object v2, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v0

    .line 145
    .local v0, "result":I
    :goto_0
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->hashCode()I

    move-result v3

    add-int v0, v2, v3

    .line 146
    mul-int/lit8 v2, v0, 0x1f

    iget-object v3, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    if-eqz v3, :cond_0

    iget-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    move-result v1

    :cond_0
    add-int v0, v2, v1

    .line 147
    return v0

    .end local v0    # "result":I
    :cond_1
    move v0, v1

    .line 144
    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    const/16 v2, 0x27

    .line 108
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "SentryException{exceptionMessage=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionMessage:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", exceptionClassName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionClassName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", exceptionPackageName=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/SentryException;->exceptionPackageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, ", stackTraceInterface="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/SentryException;->stackTraceInterface:Lio/sentry/event/interfaces/StackTraceInterface;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
