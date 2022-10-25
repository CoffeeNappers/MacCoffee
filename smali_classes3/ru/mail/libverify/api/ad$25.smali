.class final Lru/mail/libverify/api/ad$25;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lru/mail/libverify/api/ad;->searchPhoneAccounts(Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Z

.field final synthetic b:Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;

.field final synthetic c:Lru/mail/libverify/api/ad;


# direct methods
.method constructor <init>(Lru/mail/libverify/api/ad;ZLru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;)V
    .locals 0

    iput-object p1, p0, Lru/mail/libverify/api/ad$25;->c:Lru/mail/libverify/api/ad;

    iput-boolean p2, p0, Lru/mail/libverify/api/ad$25;->a:Z

    iput-object p3, p0, Lru/mail/libverify/api/ad$25;->b:Lru/mail/libverify/api/VerificationApi$PhoneAccountSearchListener;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    iget-object v0, p0, Lru/mail/libverify/api/ad$25;->c:Lru/mail/libverify/api/ad;

    new-instance v1, Lru/mail/libverify/api/ad$25$1;

    invoke-direct {v1, p0}, Lru/mail/libverify/api/ad$25$1;-><init>(Lru/mail/libverify/api/ad$25;)V

    invoke-static {v0, v1}, Lru/mail/libverify/api/ad;->a(Lru/mail/libverify/api/ad;Ljava/lang/Runnable;)V

    return-void
.end method
