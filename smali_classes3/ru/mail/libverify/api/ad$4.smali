.class final Lru/mail/libverify/api/ad$4;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/ipc/f$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

.field final synthetic b:Z

.field final synthetic c:Lru/mail/libverify/gcm/ServerNotificationMessage;

.field final synthetic d:Z

.field final synthetic e:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Lru/mail/libverify/gcm/ServerNotificationMessage$Message;ZLru/mail/libverify/gcm/ServerNotificationMessage;Z)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$4;->a:Lru/mail/libverify/gcm/ServerNotificationMessage$Message;

    iput-boolean p3, p0, Lru/mail/libverify/api/ad$4;->b:Z

    iput-object p4, p0, Lru/mail/libverify/api/ad$4;->c:Lru/mail/libverify/gcm/ServerNotificationMessage;

    iput-boolean p5, p0, Lru/mail/libverify/api/ad$4;->d:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lru/mail/libverify/ipc/f$c;)V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad$4;->e:Lru/mail/libverify/api/ad;

    iget-object v0, v0, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v1, Lru/mail/libverify/api/ad$4$1;

    invoke-direct {v1, p0, p1}, Lru/mail/libverify/api/ad$4$1;-><init>(Lru/mail/libverify/api/ad$4;Lru/mail/libverify/ipc/f$c;)V

    invoke-virtual {v0, v1}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
