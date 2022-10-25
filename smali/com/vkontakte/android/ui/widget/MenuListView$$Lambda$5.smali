.class final synthetic Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$5;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/ui/widget/MenuListView;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$5;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$5;-><init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/ui/widget/MenuListView$$Lambda$5;->arg$1:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/widget/MenuListView;->lambda$onAttachedToWindow$5()V

    return-void
.end method
