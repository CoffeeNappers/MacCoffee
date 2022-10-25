.class public Lio/sentry/event/interfaces/StackTraceInterface;
.super Ljava/lang/Object;
.source "StackTraceInterface.java"

# interfaces
.implements Lio/sentry/event/interfaces/SentryInterface;


# static fields
.field public static final STACKTRACE_INTERFACE:Ljava/lang/String; = "sentry.interfaces.Stacktrace"


# instance fields
.field private final framesCommonWithEnclosing:I

.field private final stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;


# direct methods
.method public constructor <init>([Lio/sentry/event/interfaces/SentryStackTraceElement;)V
    .locals 1
    .param p1, "stackTrace"    # [Lio/sentry/event/interfaces/SentryStackTraceElement;

    .prologue
    .line 71
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 72
    array-length v0, p1

    invoke-static {p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/sentry/event/interfaces/SentryStackTraceElement;

    iput-object v0, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    .line 73
    const/4 v0, 0x0

    iput v0, p0, Lio/sentry/event/interfaces/StackTraceInterface;->framesCommonWithEnclosing:I

    .line 74
    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;)V
    .locals 2
    .param p1, "stackTrace"    # [Ljava/lang/StackTraceElement;

    .prologue
    .line 24
    const/4 v0, 0x0

    new-array v0, v0, [Ljava/lang/StackTraceElement;

    const/4 v1, 0x0

    invoke-direct {p0, p1, v0, v1}, Lio/sentry/event/interfaces/StackTraceInterface;-><init>([Ljava/lang/StackTraceElement;[Ljava/lang/StackTraceElement;[Lio/sentry/jvmti/Frame;)V

    .line 25
    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;[Ljava/lang/StackTraceElement;)V
    .locals 1
    .param p1, "stackTrace"    # [Ljava/lang/StackTraceElement;
    .param p2, "enclosingStackTrace"    # [Ljava/lang/StackTraceElement;

    .prologue
    .line 38
    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lio/sentry/event/interfaces/StackTraceInterface;-><init>([Ljava/lang/StackTraceElement;[Ljava/lang/StackTraceElement;[Lio/sentry/jvmti/Frame;)V

    .line 39
    return-void
.end method

.method public constructor <init>([Ljava/lang/StackTraceElement;[Ljava/lang/StackTraceElement;[Lio/sentry/jvmti/Frame;)V
    .locals 4
    .param p1, "stackTrace"    # [Ljava/lang/StackTraceElement;
    .param p2, "enclosingStackTrace"    # [Ljava/lang/StackTraceElement;
    .param p3, "cachedFrames"    # [Lio/sentry/jvmti/Frame;

    .prologue
    .line 54
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 55
    invoke-static {p1, p3}, Lio/sentry/event/interfaces/SentryStackTraceElement;->fromStackTraceElements([Ljava/lang/StackTraceElement;[Lio/sentry/jvmti/Frame;)[Lio/sentry/event/interfaces/SentryStackTraceElement;

    move-result-object v2

    iput-object v2, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    .line 57
    array-length v2, p1

    add-int/lit8 v0, v2, -0x1

    .line 58
    .local v0, "m":I
    array-length v2, p2

    add-int/lit8 v1, v2, -0x1

    .line 59
    .local v1, "n":I
    :goto_0
    if-ltz v0, :cond_0

    if-ltz v1, :cond_0

    aget-object v2, p1, v0

    aget-object v3, p2, v1

    invoke-virtual {v2, v3}, Ljava/lang/StackTraceElement;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 60
    add-int/lit8 v0, v0, -0x1

    .line 61
    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    .line 63
    :cond_0
    array-length v2, p1

    add-int/lit8 v2, v2, -0x1

    sub-int/2addr v2, v0

    iput v2, p0, Lio/sentry/event/interfaces/StackTraceInterface;->framesCommonWithEnclosing:I

    .line 64
    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "o"    # Ljava/lang/Object;

    .prologue
    .line 91
    if-ne p0, p1, :cond_0

    .line 92
    const/4 v1, 0x1

    .line 100
    :goto_0
    return v1

    .line 94
    :cond_0
    if-eqz p1, :cond_1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    if-eq v1, v2, :cond_2

    .line 95
    :cond_1
    const/4 v1, 0x0

    goto :goto_0

    :cond_2
    move-object v0, p1

    .line 98
    check-cast v0, Lio/sentry/event/interfaces/StackTraceInterface;

    .line 100
    .local v0, "that":Lio/sentry/event/interfaces/StackTraceInterface;
    iget-object v1, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    iget-object v2, v0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    invoke-static {v1, v2}, Ljava/util/Arrays;->equals([Ljava/lang/Object;[Ljava/lang/Object;)Z

    move-result v1

    goto :goto_0
.end method

.method public getFramesCommonWithEnclosing()I
    .locals 1

    .prologue
    .line 86
    iget v0, p0, Lio/sentry/event/interfaces/StackTraceInterface;->framesCommonWithEnclosing:I

    return v0
.end method

.method public getInterfaceName()Ljava/lang/String;
    .locals 1

    .prologue
    .line 78
    const-string/jumbo v0, "sentry.interfaces.Stacktrace"

    return-object v0
.end method

.method public getStackTrace()[Lio/sentry/event/interfaces/SentryStackTraceElement;
    .locals 2

    .prologue
    .line 82
    iget-object v0, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    iget-object v1, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    array-length v1, v1

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;I)[Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/sentry/event/interfaces/SentryStackTraceElement;

    return-object v0
.end method

.method public hashCode()I
    .locals 1

    .prologue
    .line 105
    iget-object v0, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([Ljava/lang/Object;)I

    move-result v0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 110
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "StackTraceInterface{stackTrace="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lio/sentry/event/interfaces/StackTraceInterface;->stackTrace:[Lio/sentry/event/interfaces/SentryStackTraceElement;

    invoke-static {v1}, Ljava/util/Arrays;->toString([Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
