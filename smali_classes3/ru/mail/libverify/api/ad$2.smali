.class final Lru/mail/libverify/api/ad$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->b(Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Ljava/lang/String;

.field final synthetic b:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$2;->b:Lru/mail/libverify/api/ad;

    iput-object p2, p0, Lru/mail/libverify/api/ad$2;->a:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    iget-object v0, p0, Lru/mail/libverify/api/ad$2;->b:Lru/mail/libverify/api/ad;

    iget-object v1, p0, Lru/mail/libverify/api/ad$2;->a:Ljava/lang/String;

    sget-object v2, Lru/mail/libverify/requests/k$b;->GCM:Lru/mail/libverify/requests/k$b;

    invoke-static {v0, v1, v2}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Ljava/lang/String;Lru/mail/libverify/requests/k$b;)V

    return-void
.end method
