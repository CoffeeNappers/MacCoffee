.class final synthetic Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field private final arg$1:Ljava/util/ArrayList;

.field private final arg$2:Ljava/lang/String;

.field private final arg$3:Landroid/app/Activity;


# direct methods
.method private constructor <init>(Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/Activity;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->arg$1:Ljava/util/ArrayList;

    iput-object p2, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->arg$2:Ljava/lang/String;

    iput-object p3, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->arg$3:Landroid/app/Activity;

    return-void
.end method

.method public static lambdaFactory$(Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/Activity;)Landroid/view/View$OnClickListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;-><init>(Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/Activity;)V

    return-object v0
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->arg$1:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->arg$2:Ljava/lang/String;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/GamesFragment$Adapter$$Lambda$1;->arg$3:Landroid/app/Activity;

    invoke-static {v0, v1, v2, p1}, Lcom/vkontakte/android/fragments/GamesFragment$Adapter;->lambda$fillGameRequest$0(Ljava/util/ArrayList;Ljava/lang/String;Landroid/app/Activity;Landroid/view/View;)V

    return-void
.end method
