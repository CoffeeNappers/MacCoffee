.class final Lru/mail/libverify/api/ad$17;
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
.field final synthetic a:Z

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Z)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$17;->b:Lru/mail/libverify/api/ad;

    iput-boolean p2, p0, Lru/mail/libverify/api/ad$17;->a:Z

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Lru/mail/libverify/ipc/f$c;)V
    .locals 5

    const-string/jumbo v0, "VerificationApi"

    const-string/jumbo v1, "post fetcher started result %s with started %s"

    const/4 v2, 0x2

    new-array v2, v2, [Ljava/lang/Object;

    const/4 v3, 0x0

    aput-object p1, v2, v3

    const/4 v3, 0x1

    iget-boolean v4, p0, Lru/mail/libverify/api/ad$17;->a:Z

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v4

    aput-object v4, v2, v3

    invoke-static {v0, v1, v2}, Lru/mail/libverify/utils/d;->c(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    return-void
.end method
