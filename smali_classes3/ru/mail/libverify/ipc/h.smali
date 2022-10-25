.class final Lru/mail/libverify/ipc/h;
.super Lru/mail/libverify/ipc/a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/ipc/h$a;
    }
.end annotation


# instance fields
.field private final e:Ljava/lang/String;

.field private final f:Ljava/lang/String;

.field private g:Ljava/lang/String;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/l;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lru/mail/libverify/api/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lru/mail/libverify/ipc/a;-><init>(Lru/mail/libverify/api/l;)V

    iput-object p2, p0, Lru/mail/libverify/ipc/h;->e:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/ipc/h;->f:Ljava/lang/String;

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/l;Ljava/lang/String;Ljava/lang/String;B)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Lru/mail/libverify/ipc/h;-><init>(Lru/mail/libverify/api/l;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private a(Landroid/os/Message;)Z
    .locals 7

    const/4 v1, 0x1

    const/4 v0, 0x0

    const-string/jumbo v2, "SmsTextClientHandler"

    const-string/jumbo v3, "processGetSessionsAckMessage"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    move-result-object v2

    const-string/jumbo v3, "data"

    invoke-virtual {v2, v3}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-eqz v3, :cond_0

    const-string/jumbo v2, "SmsTextClientHandler"

    const-string/jumbo v3, "validateGetSessionsAckMessage can\'t parse empty ids"

    invoke-static {v2, v3}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    move v2, v0

    :goto_0
    if-nez v2, :cond_3

    const-string/jumbo v1, "SmsTextClientHandler"

    const-string/jumbo v2, "processGetSessionsAckMessage - received message is not valid"

    invoke-static {v1, v2}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;)V

    :goto_1
    return v0

    :cond_0
    const-string/jumbo v3, ","

    invoke-virtual {v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    move v2, v0

    :goto_2
    array-length v4, v3

    if-ge v2, v4, :cond_2

    const/4 v4, 0x5

    if-ge v2, v4, :cond_2

    invoke-direct {p0}, Lru/mail/libverify/ipc/h;->c()Ljava/lang/String;

    move-result-object v4

    aget-object v5, v3, v2

    invoke-static {v4, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    const-string/jumbo v2, "SmsTextClientHandler"

    const-string/jumbo v3, "validateGetSessionsAckMessage found requested session id %s"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lru/mail/libverify/ipc/h;->e:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v2, v1

    goto :goto_0

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    :cond_2
    const-string/jumbo v2, "SmsTextClientHandler"

    const-string/jumbo v3, "validateGetSessionsAckMessage session id %s not found"

    const/4 v4, 0x1

    new-array v4, v4, [Ljava/lang/Object;

    const/4 v5, 0x0

    iget-object v6, p0, Lru/mail/libverify/ipc/h;->e:Ljava/lang/String;

    aput-object v6, v4, v5

    invoke-static {v2, v3, v4}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    move v2, v0

    goto :goto_0

    :cond_3
    iget-object v2, p0, Lru/mail/libverify/ipc/h;->c:Landroid/os/Messenger;

    const/4 v3, 0x3

    invoke-static {p0, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v3

    invoke-virtual {p0}, Lru/mail/libverify/ipc/h;->a()Landroid/os/Messenger;

    move-result-object v4

    iput-object v4, v3, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    new-instance v4, Landroid/os/Bundle;

    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    const-string/jumbo v5, "data"

    iget-object v6, p0, Lru/mail/libverify/ipc/h;->f:Ljava/lang/String;

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string/jumbo v5, "receiver"

    invoke-direct {p0}, Lru/mail/libverify/ipc/h;->c()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v3, v4}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-virtual {v2, v3}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move v0, v1

    goto :goto_1

    :catch_0
    move-exception v1

    const-string/jumbo v2, "SmsTextClientHandler"

    const-string/jumbo v3, "processGetSessionsAckMessage"

    invoke-static {v2, v3, v1}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_1
.end method

.method private c()Ljava/lang/String;
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/ipc/h;->g:Ljava/lang/String;

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/ipc/h;->e:Ljava/lang/String;

    invoke-static {v0}, Lru/mail/libverify/utils/m;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lru/mail/libverify/ipc/h;->g:Ljava/lang/String;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/ipc/h;->g:Ljava/lang/String;

    return-object v0
.end method


# virtual methods
.method protected final b()V
    .locals 3

    :try_start_0
    iget-object v0, p0, Lru/mail/libverify/ipc/h;->c:Landroid/os/Messenger;

    const/4 v1, 0x1

    invoke-static {p0, v1}, Landroid/os/Message;->obtain(Landroid/os/Handler;I)Landroid/os/Message;

    move-result-object v1

    invoke-virtual {p0}, Lru/mail/libverify/ipc/h;->a()Landroid/os/Messenger;

    move-result-object v2

    iput-object v2, v1, Landroid/os/Message;->replyTo:Landroid/os/Messenger;

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v1, v2}, Landroid/os/Message;->setData(Landroid/os/Bundle;)V

    invoke-virtual {v0, v1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :goto_0
    return-void

    :catch_0
    move-exception v0

    const-string/jumbo v1, "SmsTextClientHandler"

    const-string/jumbo v2, "postDataToService"

    invoke-static {v1, v2, v0}, Lru/mail/libverify/utils/d;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public final handleMessage(Landroid/os/Message;)V
    .locals 6

    const/4 v4, 0x1

    const/4 v5, 0x0

    iget-boolean v0, p0, Lru/mail/libverify/ipc/a;->d:Z

    if-eqz v0, :cond_1

    :cond_0
    :goto_0
    return-void

    :cond_1
    invoke-super {p0, p1}, Lru/mail/libverify/ipc/a;->handleMessage(Landroid/os/Message;)V

    if-eqz p1, :cond_0

    const-string/jumbo v0, "SmsTextClientHandler"

    const-string/jumbo v1, "handleMessage %s"

    new-array v2, v4, [Ljava/lang/Object;

    invoke-virtual {p1}, Landroid/os/Message;->toString()Ljava/lang/String;

    move-result-object v3

    aput-object v3, v2, v5

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    iget v0, p1, Landroid/os/Message;->what:I

    packed-switch v0, :pswitch_data_0

    :pswitch_0
    const-string/jumbo v0, "SmsTextClientHandler"

    const-string/jumbo v1, "handleMessage"

    new-instance v2, Ljava/lang/IllegalArgumentException;

    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "Can\'t process message with type "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v4, p1, Landroid/os/Message;->what:I

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/c;->a(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    iget-object v0, p0, Lru/mail/libverify/ipc/h;->b:Lru/mail/libverify/ipc/a$a;

    invoke-interface {v0, v5}, Lru/mail/libverify/ipc/a$a;->a(Z)V

    goto :goto_0

    :pswitch_1
    invoke-direct {p0, p1}, Lru/mail/libverify/ipc/h;->a(Landroid/os/Message;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/ipc/h;->b:Lru/mail/libverify/ipc/a$a;

    invoke-interface {v0, v5}, Lru/mail/libverify/ipc/a$a;->a(Z)V

    goto :goto_0

    :pswitch_2
    iget-object v0, p0, Lru/mail/libverify/ipc/h;->b:Lru/mail/libverify/ipc/a$a;

    invoke-interface {v0, v4}, Lru/mail/libverify/ipc/a$a;->a(Z)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_1
        :pswitch_0
        :pswitch_2
    .end packed-switch
.end method
