.class Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl$2;
.super Ljava/lang/Object;
.source "VerificationControllerImpl.java"

# interfaces
.implements Lru/mail/libverify/api/UncaughtExceptionListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;->getExceptionListener()Lru/mail/libverify/api/UncaughtExceptionListener;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    .prologue
    .line 87
    iput-object p1, p0, Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl$2;->this$0:Lcom/vkontakte/android/auth/libverify/VerificationControllerImpl;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 3
    .param p1, "thread"    # Ljava/lang/Thread;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "throwable"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 90
    const/4 v0, 0x2

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    if-nez p1, :cond_0

    const-string/jumbo v0, ""

    :goto_0
    aput-object v0, v1, v2

    const/4 v0, 0x1

    invoke-virtual {p2}, Ljava/lang/Throwable;->toString()Ljava/lang/String;

    move-result-object v2

    aput-object v2, v1, v0

    invoke-static {p2, v1}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 91
    return-void

    .line 90
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
