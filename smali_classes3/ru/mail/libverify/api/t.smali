.class interface abstract Lru/mail/libverify/api/t;
.super Ljava/lang/Object;


# virtual methods
.method public abstract a(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract a(Ljava/lang/String;Lru/mail/libverify/gcm/ServerNotificationMessage;)Lru/mail/libverify/gcm/ServerNotificationMessage;
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lru/mail/libverify/gcm/ServerNotificationMessage;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract a()Z
.end method

.method public abstract b()Ljava/util/Collection;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection",
            "<",
            "Lru/mail/libverify/gcm/ServerNotificationMessage;",
            ">;"
        }
    .end annotation
.end method

.method public abstract b(Ljava/lang/String;)Lru/mail/libverify/gcm/ServerNotificationMessage;
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
.end method

.method public abstract c()V
.end method
