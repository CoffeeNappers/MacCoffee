.class public final Lio/reactivex/Notification;
.super Ljava/lang/Object;
.source "Notification.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# static fields
.field static final COMPLETE:Lio/reactivex/Notification;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lio/reactivex/Notification",
            "<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final value:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .prologue
    .line 154
    new-instance v0, Lio/reactivex/Notification;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lio/reactivex/Notification;-><init>(Ljava/lang/Object;)V

    sput-object v0, Lio/reactivex/Notification;->COMPLETE:Lio/reactivex/Notification;

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;)V
    .locals 0
    .param p1, "value"    # Ljava/lang/Object;

    .prologue
    .line 29
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p1, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 31
    return-void
.end method

.method public static createOnComplete()Lio/reactivex/Notification;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lio/reactivex/Notification",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 150
    sget-object v0, Lio/reactivex/Notification;->COMPLETE:Lio/reactivex/Notification;

    return-object v0
.end method

.method public static createOnError(Ljava/lang/Throwable;)Lio/reactivex/Notification;
    .locals 2
    .param p0, "error"    # Ljava/lang/Throwable;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Throwable;",
            ")",
            "Lio/reactivex/Notification",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 138
    const-string/jumbo v0, "error is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 139
    new-instance v0, Lio/reactivex/Notification;

    invoke-static {p0}, Lio/reactivex/internal/util/NotificationLite;->error(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object v1

    invoke-direct {v0, v1}, Lio/reactivex/Notification;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method

.method public static createOnNext(Ljava/lang/Object;)Lio/reactivex/Notification;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lio/reactivex/Notification",
            "<TT;>;"
        }
    .end annotation

    .prologue
    .line 126
    .local p0, "value":Ljava/lang/Object;, "TT;"
    const-string/jumbo v0, "value is null"

    invoke-static {p0, v0}, Lio/reactivex/internal/functions/ObjectHelper;->requireNonNull(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    .line 127
    new-instance v0, Lio/reactivex/Notification;

    invoke-direct {v0, p0}, Lio/reactivex/Notification;-><init>(Ljava/lang/Object;)V

    return-object v0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3
    .param p1, "obj"    # Ljava/lang/Object;

    .prologue
    .line 93
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    instance-of v1, p1, Lio/reactivex/Notification;

    if-eqz v1, :cond_0

    move-object v0, p1

    .line 94
    check-cast v0, Lio/reactivex/Notification;

    .line 95
    .local v0, "n":Lio/reactivex/Notification;, "Lio/reactivex/Notification<*>;"
    iget-object v1, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    iget-object v2, v0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    invoke-static {v1, v2}, Lio/reactivex/internal/functions/ObjectHelper;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    .line 97
    .end local v0    # "n":Lio/reactivex/Notification;, "Lio/reactivex/Notification<*>;"
    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getError()Ljava/lang/Throwable;
    .locals 2

    .prologue
    .line 84
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 85
    .local v0, "o":Ljava/lang/Object;
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 86
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v1

    .line 88
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public getValue()Ljava/lang/Object;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .prologue
    .line 70
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 71
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 72
    iget-object v1, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 74
    :goto_0
    return-object v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public hashCode()I
    .locals 2

    .prologue
    .line 102
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 103
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/Object;->hashCode()I

    move-result v1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public isOnComplete()Z
    .locals 1

    .prologue
    .line 38
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isOnError()Z
    .locals 1

    .prologue
    .line 48
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public isOnNext()Z
    .locals 2

    .prologue
    .line 58
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 59
    .local v0, "o":Ljava/lang/Object;
    if-eqz v0, :cond_0

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const/4 v1, 0x1

    :goto_0
    return v1

    :cond_0
    const/4 v1, 0x0

    goto :goto_0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .prologue
    .line 108
    .local p0, "this":Lio/reactivex/Notification;, "Lio/reactivex/Notification<TT;>;"
    iget-object v0, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    .line 109
    .local v0, "o":Ljava/lang/Object;
    if-nez v0, :cond_0

    .line 110
    const-string/jumbo v1, "OnCompleteNotification"

    .line 115
    :goto_0
    return-object v1

    .line 112
    :cond_0
    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->isError(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 113
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "OnErrorNotification["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Lio/reactivex/internal/util/NotificationLite;->getError(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    .line 115
    :cond_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "OnNextNotification["

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lio/reactivex/Notification;->value:Ljava/lang/Object;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string/jumbo v2, "]"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0
.end method
