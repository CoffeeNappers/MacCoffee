.class final Lru/mail/libverify/api/af$5;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/sms/g$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/af;->p()V
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

    iput-object p1, p0, Lru/mail/libverify/api/af$5;->a:Lru/mail/libverify/api/af;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Z
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    iget-object v0, p0, Lru/mail/libverify/api/af$5;->a:Lru/mail/libverify/api/af;

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lru/mail/libverify/api/af;->a(Lru/mail/libverify/api/af;Ljava/lang/String;Z)Z

    move-result v0

    return v0
.end method
