.class final Lru/mail/libverify/api/r$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field final a:Ljava/util/concurrent/Future;

.field final b:Lru/mail/libverify/api/r$a;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/r$a;Ljava/util/concurrent/Future;)V
    .locals 0
    .param p1    # Lru/mail/libverify/api/r$a;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/concurrent/Future;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/api/r$b;->b:Lru/mail/libverify/api/r$a;

    iput-object p2, p0, Lru/mail/libverify/api/r$b;->a:Ljava/util/concurrent/Future;

    return-void
.end method
