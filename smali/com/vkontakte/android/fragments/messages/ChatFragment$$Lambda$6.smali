.class final synthetic Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$6;
.super Ljava/lang/Object;

# interfaces
.implements Lio/reactivex/functions/Consumer;


# instance fields
.field private final arg$1:Landroid/support/v7/widget/Toolbar;


# direct methods
.method private constructor <init>(Landroid/support/v7/widget/Toolbar;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$6;->arg$1:Landroid/support/v7/widget/Toolbar;

    return-void
.end method

.method public static lambdaFactory$(Landroid/support/v7/widget/Toolbar;)Lio/reactivex/functions/Consumer;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$6;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$6;-><init>(Landroid/support/v7/widget/Toolbar;)V

    return-object v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatFragment$$Lambda$6;->arg$1:Landroid/support/v7/widget/Toolbar;

    check-cast p1, Landroid/graphics/Bitmap;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/messages/ChatFragment;->lambda$setDialogIcon$4(Landroid/support/v7/widget/Toolbar;Landroid/graphics/Bitmap;)V

    return-void
.end method
