.class final Lru/mail/libverify/api/af$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/api/af;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lru/mail/libverify/api/af;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/af;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/af$1;->a:Lru/mail/libverify/api/af;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lru/mail/libverify/api/af$1;->a:Lru/mail/libverify/api/af;

    invoke-static {v0}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;)V

    return-void
.end method
