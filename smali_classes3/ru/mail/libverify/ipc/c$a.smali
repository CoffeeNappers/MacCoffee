.class public final Lru/mail/libverify/ipc/c$a;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/ipc/d;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lru/mail/libverify/ipc/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private final a:Lru/mail/libverify/api/l;

.field private final b:J

.field private final c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lru/mail/libverify/api/l;Ljava/lang/String;J)V
    .locals 1
    .param p1    # Lru/mail/libverify/api/l;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lru/mail/libverify/ipc/c$a;->a:Lru/mail/libverify/api/l;

    iput-object p2, p0, Lru/mail/libverify/ipc/c$a;->c:Ljava/lang/String;

    iput-wide p3, p0, Lru/mail/libverify/ipc/c$a;->b:J

    return-void
.end method


# virtual methods
.method public final a()Lru/mail/libverify/ipc/a;
    .locals 7

    new-instance v1, Lru/mail/libverify/ipc/c;

    iget-object v2, p0, Lru/mail/libverify/ipc/c$a;->a:Lru/mail/libverify/api/l;

    iget-object v3, p0, Lru/mail/libverify/ipc/c$a;->c:Ljava/lang/String;

    iget-wide v4, p0, Lru/mail/libverify/ipc/c$a;->b:J

    const/4 v6, 0x0

    invoke-direct/range {v1 .. v6}, Lru/mail/libverify/ipc/c;-><init>(Lru/mail/libverify/api/l;Ljava/lang/String;JB)V

    return-object v1
.end method

.method public final a(Landroid/content/Context;Ljava/lang/String;)Z
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-static {p1, p2}, Lru/mail/libverify/utils/m;->a(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public final b()Ljava/lang/Class;
    .locals 1

    const-class v0, Lru/mail/libverify/ipc/IpcNotificationService;

    return-object v0
.end method
