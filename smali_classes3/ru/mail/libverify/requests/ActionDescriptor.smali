.class final Lru/mail/libverify/requests/ActionDescriptor;
.super Ljava/lang/Object;

# interfaces
.implements Lru/mail/libverify/utils/Gsonable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lru/mail/libverify/requests/ActionDescriptor$a;
    }
.end annotation


# instance fields
.field private transient a:Lru/mail/libverify/requests/m;

.field attemptCount:I

.field lastAttemptTimestamp:J

.field private final requestJson:Ljava/lang/String;

.field public final type:Lru/mail/libverify/requests/ActionDescriptor$a;


# direct methods
.method private constructor <init>()V
    .locals 3

    const/4 v2, 0x0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->lastAttemptTimestamp:J

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    iput-object v2, p0, Lru/mail/libverify/requests/ActionDescriptor;->type:Lru/mail/libverify/requests/ActionDescriptor$a;

    iput-object v2, p0, Lru/mail/libverify/requests/ActionDescriptor;->requestJson:Ljava/lang/String;

    return-void
.end method

.method constructor <init>(Lru/mail/libverify/requests/ActionDescriptor$a;Lru/mail/libverify/requests/m;)V
    .locals 2
    .param p2    # Lru/mail/libverify/requests/m;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->lastAttemptTimestamp:J

    const/4 v0, 0x0

    iput v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->attemptCount:I

    iput-object p1, p0, Lru/mail/libverify/requests/ActionDescriptor;->type:Lru/mail/libverify/requests/ActionDescriptor$a;

    iget-object v0, p2, Lru/mail/libverify/requests/m;->a:Ljava/lang/String;

    iput-object v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->requestJson:Ljava/lang/String;

    iput-object p2, p0, Lru/mail/libverify/requests/ActionDescriptor;->a:Lru/mail/libverify/requests/m;

    return-void
.end method


# virtual methods
.method final a()Lru/mail/libverify/requests/m;
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->a:Lru/mail/libverify/requests/m;

    if-nez v0, :cond_0

    new-instance v0, Lru/mail/libverify/requests/m;

    iget-object v1, p0, Lru/mail/libverify/requests/ActionDescriptor;->requestJson:Ljava/lang/String;

    invoke-direct {v0, v1}, Lru/mail/libverify/requests/m;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->a:Lru/mail/libverify/requests/m;

    :cond_0
    iget-object v0, p0, Lru/mail/libverify/requests/ActionDescriptor;->a:Lru/mail/libverify/requests/m;

    return-object v0
.end method
