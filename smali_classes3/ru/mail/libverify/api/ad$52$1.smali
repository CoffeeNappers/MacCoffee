.class final Lru/mail/libverify/api/ad$52$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad$52;->a(Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/ad$52;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad$52;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$52$1;->a:Lru/mail/libverify/api/ad$52;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/ad$52$1;->a:Lru/mail/libverify/api/ad$52;

    iget-object v0, v0, Lru/mail/libverify/api/ad$52;->b:Ljava/lang/Runnable;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lru/mail/libverify/api/ad$52$1;->a:Lru/mail/libverify/api/ad$52;

    iget-object v0, v0, Lru/mail/libverify/api/ad$52;->b:Ljava/lang/Runnable;

    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_0
    return-void
.end method
