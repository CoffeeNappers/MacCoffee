.class public final Lru/mail/libverify/requests/e$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/requests/e;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable",
        "<TT;>;"
    }
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/utils/e;

.field final synthetic b:Lru/mail/libverify/requests/e;


# direct methods
.method public constructor <init>(Lru/mail/libverify/requests/e;Lru/mail/libverify/utils/e;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/requests/e$2;->b:Lru/mail/libverify/requests/e;

    iput-object p2, p0, Lru/mail/libverify/requests/e$2;->a:Lru/mail/libverify/utils/e;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final synthetic call()Ljava/lang/Object;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/requests/e$2;->b:Lru/mail/libverify/requests/e;

    iget-object v1, p0, Lru/mail/libverify/requests/e$2;->a:Lru/mail/libverify/utils/e;

    invoke-static {v0, v1}, Lru/mail/libverify/requests/e;->a(Lru/mail/libverify/requests/e;Lru/mail/libverify/utils/e;)Lru/mail/libverify/requests/response/ClientApiResponseBase;

    move-result-object v0

    return-object v0
.end method
