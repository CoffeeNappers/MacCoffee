.class Lcom/vkontakte/android/auth/VKAuth$AuthResult;
.super Ljava/lang/Object;
.source "VKAuth.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/auth/VKAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "AuthResult"
.end annotation


# instance fields
.field public final authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public final code:I


# direct methods
.method public constructor <init>(ILcom/vkontakte/android/auth/VKAuth$AuthAnswer;)V
    .locals 0
    .param p1, "code"    # I
    .param p2, "authAnswer"    # Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 396
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 397
    iput p1, p0, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->code:I

    .line 398
    iput-object p2, p0, Lcom/vkontakte/android/auth/VKAuth$AuthResult;->authAnswer:Lcom/vkontakte/android/auth/VKAuth$AuthAnswer;

    .line 399
    return-void
.end method
