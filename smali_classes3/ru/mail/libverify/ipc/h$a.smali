.class public final Lru/mail/libverify/ipc/h$a;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/ipc/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/ipc/h;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private final a:Lru/mail/libverify/api/l;

.field private final b:Ljava/lang/String;

.field private final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lru/mail/libverify/api/l;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lru/mail/libverify/api/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/ipc/h$a;->a:Lru/mail/libverify/api/l;

    iput-object p2, p0, Lru/mail/libverify/ipc/h$a;->b:Ljava/lang/String;

    iput-object p3, p0, Lru/mail/libverify/ipc/h$a;->c:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/ipc/a;
    .locals 5

    new-instance v0, Lru/mail/libverify/ipc/h;

    iget-object v1, p0, Lru/mail/libverify/ipc/h$a;->a:Lru/mail/libverify/api/l;

    iget-object v2, p0, Lru/mail/libverify/ipc/h$a;->b:Ljava/lang/String;

    iget-object v3, p0, Lru/mail/libverify/ipc/h$a;->c:Ljava/lang/String;

    const/4 v4, 0x0

    invoke-direct {v0, v1, v2, v3, v4}, Lru/mail/libverify/ipc/h;-><init>(Lru/mail/libverify/api/l;Ljava/lang/String;Ljava/lang/String;B)V

    return-object v0
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 2
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    const-string/jumbo v0, "android.permission.READ_SMS"

    invoke-static {p1, p2, v0}, Lru/mail/libverify/utils/m;->a(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Z

    move-result v0

    invoke-static {p1, p2}, Lru/mail/libverify/utils/m;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v1

    if-eqz v0, :cond_0

    if-eqz v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public final b()Ljava/lang/Class;
    .locals 1

    const-class v0, Lru/mail/libverify/ipc/IpcMessageService;

    return-object v0
.end method
