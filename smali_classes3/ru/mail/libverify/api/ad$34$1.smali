.class final Lru/mail/libverify/api/ad$34$1;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/api/z;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$34;->b()Lru/mail/libverify/api/z;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$34;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$34;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$34$1;->a:Lru/mail/libverify/api/ad$34;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Lru/mail/libverify/api/ae;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    new-instance v0, Lru/mail/libverify/api/af;

    iget-object v1, p0, Lru/mail/libverify/api/ad$34$1;->a:Lru/mail/libverify/api/ad$34;

    iget-object v1, v1, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v1}, Lru/mail/libverify/api/ad;->i(Lru/mail/libverify/api/ad;)Lru/mail/libverify/api/v;

    move-result-object v1

    iget-object v2, p0, Lru/mail/libverify/api/ad$34$1;->a:Lru/mail/libverify/api/ad$34;

    iget-object v2, v2, Lru/mail/libverify/api/ad$34;->a:Lru/mail/libverify/api/ad;

    invoke-static {v2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;)Lru/mail/libverify/storage/l;

    move-result-object v2

    invoke-direct {v0, v1, v2, p1}, Lru/mail/libverify/api/af;-><init>(Lru/mail/libverify/api/v;Lru/mail/libverify/storage/k;Ljava/lang/String;)V

    return-object v0
.end method
