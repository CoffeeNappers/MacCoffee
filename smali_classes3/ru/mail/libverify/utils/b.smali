.class public final Lru/mail/libverify/utils/b;
.super Landroid/os/Handler;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/utils/b$a;
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Landroid/os/Handler;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Runnable;)V
    .locals 1

    invoke-static {}, Lru/mail/libverify/utils/l;->a()V

    new-instance v0, Lru/mail/libverify/utils/b$a;

    invoke-direct {v0, p1}, Lru/mail/libverify/utils/b$a;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p0}, Lru/mail/libverify/utils/b$a;->a(Landroid/os/Handler;)Z

    return-void
.end method
