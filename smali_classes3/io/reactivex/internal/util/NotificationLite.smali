.class public final enum Lio/reactivex/internal/util/NotificationLite;
.super Ljava/lang/Enum;
.source "NotificationLite.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lio/reactivex/internal/util/NotificationLite$DisposableNotification;,
        Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;,
        Lio/reactivex/internal/util/NotificationLite$ErrorNotification;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum",
        "<",
        "Lio/reactivex/internal/util/NotificationLite;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lio/reactivex/internal/util/NotificationLite;

.field public static final enum COMPLETE:Lio/reactivex/internal/util/NotificationLite;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .prologue
    const/4 v2, 0x0

    .line 27
    new-instance v0, Lio/reactivex/internal/util/NotificationLite;

    const-string/jumbo v1, "COMPLETE"

    invoke-direct {v0, v1, v2}, Lio/reactivex/internal/util/NotificationLite;-><init>(Ljava/lang/String;I)V

    sput-object v0, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    .line 26
    const/4 v0, 0x1

    new-array v0, v0, [Lio/reactivex/internal/util/NotificationLite;

    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    aput-object v1, v0, v2

    sput-object v0, Lio/reactivex/internal/util/NotificationLite;->$VALUES:[Lio/reactivex/internal/util/NotificationLite;

    return-void
.end method

.method private constructor <init>(Ljava/lang/String;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .prologue
    .line 26
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 81
    return-void
.end method

.method public static accept(Ljava/lang/Object;Lio/reactivex/Observer;)Z
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lio/reactivex/Observer",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v0, 0x1

    .line 238
    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-ne p0, v1, :cond_0

    .line 239
    invoke-interface {p1}, Lio/reactivex/Observer;->onComplete()V

    .line 247
    .end local p0    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .line 242
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    if-eqz v1, :cond_1

    .line 243
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;->e:Ljava/lang/Throwable;

    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 246
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_1
    invoke-interface {p1, p0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    .line 247
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static accept(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z
    .locals 2
    .param p0, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v0, 0x1

    .line 216
    sget-object v1, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-ne p0, v1, :cond_0

    .line 217
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 225
    .end local p0    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .line 220
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v1, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    if-eqz v1, :cond_1

    .line 221
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;->e:Ljava/lang/Throwable;

    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 224
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_1
    invoke-interface {p1, p0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    .line 225
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static acceptFull(Ljava/lang/Object;Lio/reactivex/Observer;)Z
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lio/reactivex/Observer",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "s":Lio/reactivex/Observer;, "Lio/reactivex/Observer<-TT;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 286
    sget-object v2, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-ne p0, v2, :cond_0

    .line 287
    invoke-interface {p1}, Lio/reactivex/Observer;->onComplete()V

    .line 299
    .end local p0    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .line 290
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    if-eqz v2, :cond_1

    .line 291
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;->e:Ljava/lang/Throwable;

    invoke-interface {p1, v1}, Lio/reactivex/Observer;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 294
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;

    if-eqz v0, :cond_2

    .line 295
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;->d:Lio/reactivex/disposables/Disposable;

    invoke-interface {p1, v0}, Lio/reactivex/Observer;->onSubscribe(Lio/reactivex/disposables/Disposable;)V

    move v0, v1

    .line 296
    goto :goto_0

    .line 298
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_2
    invoke-interface {p1, p0}, Lio/reactivex/Observer;->onNext(Ljava/lang/Object;)V

    move v0, v1

    .line 299
    goto :goto_0
.end method

.method public static acceptFull(Ljava/lang/Object;Lorg/reactivestreams/Subscriber;)Z
    .locals 3
    .param p0, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            "Lorg/reactivestreams/Subscriber",
            "<-TT;>;)Z"
        }
    .end annotation

    .prologue
    .local p1, "s":Lorg/reactivestreams/Subscriber;, "Lorg/reactivestreams/Subscriber<-TT;>;"
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 260
    sget-object v2, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-ne p0, v2, :cond_0

    .line 261
    invoke-interface {p1}, Lorg/reactivestreams/Subscriber;->onComplete()V

    .line 273
    .end local p0    # "o":Ljava/lang/Object;
    :goto_0
    return v0

    .line 264
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_0
    instance-of v2, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    if-eqz v2, :cond_1

    .line 265
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v1, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;->e:Ljava/lang/Throwable;

    invoke-interface {p1, v1}, Lorg/reactivestreams/Subscriber;->onError(Ljava/lang/Throwable;)V

    goto :goto_0

    .line 268
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_1
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    if-eqz v0, :cond_2

    .line 269
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;->s:Lorg/reactivestreams/Subscription;

    invoke-interface {p1, v0}, Lorg/reactivestreams/Subscriber;->onSubscribe(Lorg/reactivestreams/Subscription;)V

    move v0, v1

    .line 270
    goto :goto_0

    .line 272
    .restart local p0    # "o":Ljava/lang/Object;
    :cond_2
    invoke-interface {p1, p0}, Lorg/reactivestreams/Subscriber;->onNext(Ljava/lang/Object;)V

    move v0, v1

    .line 273
    goto :goto_0
.end method

.method public static complete()Ljava/lang/Object;
    .locals 1

    .prologue
    .line 111
    sget-object v0, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    return-object v0
.end method

.method public static disposable(Lio/reactivex/disposables/Disposable;)Ljava/lang/Object;
    .locals 1
    .param p0, "d"    # Lio/reactivex/disposables/Disposable;

    .prologue
    .line 138
    new-instance v0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;

    invoke-direct {v0, p0}, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;-><init>(Lio/reactivex/disposables/Disposable;)V

    return-object v0
.end method

.method public static error(Ljava/lang/Throwable;)Ljava/lang/Object;
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;

    .prologue
    .line 120
    new-instance v0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    invoke-direct {v0, p0}, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;-><init>(Ljava/lang/Throwable;)V

    return-object v0
.end method

.method public static getDisposable(Ljava/lang/Object;)Lio/reactivex/disposables/Disposable;
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 202
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;->d:Lio/reactivex/disposables/Disposable;

    return-object v0
.end method

.method public static getError(Ljava/lang/Object;)Ljava/lang/Throwable;
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 189
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;->e:Ljava/lang/Throwable;

    return-object v0
.end method

.method public static getSubscription(Ljava/lang/Object;)Lorg/reactivestreams/Subscription;
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 198
    check-cast p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    .end local p0    # "o":Ljava/lang/Object;
    iget-object v0, p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;->s:Lorg/reactivestreams/Subscription;

    return-object v0
.end method

.method public static getValue(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .param p0, "o"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Object;",
            ")TT;"
        }
    .end annotation

    .prologue
    .line 180
    return-object p0
.end method

.method public static isComplete(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 147
    sget-object v0, Lio/reactivex/internal/util/NotificationLite;->COMPLETE:Lio/reactivex/internal/util/NotificationLite;

    if-ne p0, v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public static isDisposable(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 169
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$DisposableNotification;

    return v0
.end method

.method public static isError(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 156
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$ErrorNotification;

    return v0
.end method

.method public static isSubscription(Ljava/lang/Object;)Z
    .locals 1
    .param p0, "o"    # Ljava/lang/Object;

    .prologue
    .line 165
    instance-of v0, p0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    return v0
.end method

.method public static next(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .prologue
    .line 103
    .local p0, "value":Ljava/lang/Object;, "TT;"
    return-object p0
.end method

.method public static subscription(Lorg/reactivestreams/Subscription;)Ljava/lang/Object;
    .locals 1
    .param p0, "s"    # Lorg/reactivestreams/Subscription;

    .prologue
    .line 129
    new-instance v0, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;

    invoke-direct {v0, p0}, Lio/reactivex/internal/util/NotificationLite$SubscriptionNotification;-><init>(Lorg/reactivestreams/Subscription;)V

    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lio/reactivex/internal/util/NotificationLite;
    .locals 1
    .param p0, "name"    # Ljava/lang/String;

    .prologue
    .line 26
    const-class v0, Lio/reactivex/internal/util/NotificationLite;

    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    move-result-object v0

    check-cast v0, Lio/reactivex/internal/util/NotificationLite;

    return-object v0
.end method

.method public static values()[Lio/reactivex/internal/util/NotificationLite;
    .locals 1

    .prologue
    .line 26
    sget-object v0, Lio/reactivex/internal/util/NotificationLite;->$VALUES:[Lio/reactivex/internal/util/NotificationLite;

    invoke-virtual {v0}, [Lio/reactivex/internal/util/NotificationLite;->clone()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, [Lio/reactivex/internal/util/NotificationLite;

    return-object v0
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 1

    .prologue
    .line 304
    const-string/jumbo v0, "NotificationLite.Complete"

    return-object v0
.end method
