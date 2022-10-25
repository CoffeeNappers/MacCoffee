.class final Lru/mail/libverify/api/ad$g;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/c$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/ad;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "g"
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad;


# direct methods
.method private constructor <init>(Lru/mail/libverify/api/ad;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$g;->a:Lru/mail/libverify/api/ad;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lru/mail/libverify/api/ad;B)V
    .locals 0

    invoke-direct {p0, p1}, Lru/mail/libverify/api/ad$g;-><init>(Lru/mail/libverify/api/ad;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Throwable;)V
    .locals 3

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    iget-object v1, p0, Lru/mail/libverify/api/ad$g;->a:Lru/mail/libverify/api/ad;

    iget-object v1, v1, Lru/mail/libverify/api/ad;->b:Lru/mail/libverify/utils/b;

    new-instance v2, Lru/mail/libverify/api/ad$g$1;

    invoke-direct {v2, p0, v0, p1}, Lru/mail/libverify/api/ad$g$1;-><init>(Lru/mail/libverify/api/ad$g;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v2}, Lru/mail/libverify/utils/b;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
