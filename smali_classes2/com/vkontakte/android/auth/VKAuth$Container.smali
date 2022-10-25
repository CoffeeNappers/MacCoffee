.class Lcom/vkontakte/android/auth/VKAuth$Container;
.super Ljava/lang/Object;
.source "VKAuth.java"

# interfaces
.implements Lcom/vkontakte/android/api/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/auth/VKAuth;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "Container"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/vkontakte/android/api/Callback",
        "<TT;>;"
    }
.end annotation


# instance fields
.field object:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .locals 0

    .prologue
    .line 377
    .local p0, "this":Lcom/vkontakte/android/auth/VKAuth$Container;, "Lcom/vkontakte/android/auth/VKAuth$Container<TT;>;"
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/auth/VKAuth$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/auth/VKAuth$1;

    .prologue
    .line 377
    .local p0, "this":Lcom/vkontakte/android/auth/VKAuth$Container;, "Lcom/vkontakte/android/auth/VKAuth$Container<TT;>;"
    invoke-direct {p0}, Lcom/vkontakte/android/auth/VKAuth$Container;-><init>()V

    return-void
.end method


# virtual methods
.method public fail(Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;)V
    .locals 1
    .param p1, "error"    # Lcom/vkontakte/android/api/VKAPIRequest$VKErrorResponse;

    .prologue
    .line 387
    .local p0, "this":Lcom/vkontakte/android/auth/VKAuth$Container;, "Lcom/vkontakte/android/auth/VKAuth$Container<TT;>;"
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/vkontakte/android/auth/VKAuth$Container;->object:Ljava/lang/Object;

    .line 388
    return-void
.end method

.method public success(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .prologue
    .line 382
    .local p0, "this":Lcom/vkontakte/android/auth/VKAuth$Container;, "Lcom/vkontakte/android/auth/VKAuth$Container<TT;>;"
    .local p1, "result":Ljava/lang/Object;, "TT;"
    iput-object p1, p0, Lcom/vkontakte/android/auth/VKAuth$Container;->object:Ljava/lang/Object;

    .line 383
    return-void
.end method
