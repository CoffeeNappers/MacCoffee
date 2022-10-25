.class final synthetic Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;

.field private final arg$2:Z

.field private final arg$3:Ljava/util/ArrayList;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;ZLjava/util/ArrayList;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;

    iput-boolean p2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->arg$2:Z

    iput-object p3, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->arg$3:Ljava/util/ArrayList;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;ZLjava/util/ArrayList;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;

    invoke-direct {v0, p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;ZLjava/util/ArrayList;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 3
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;

    iget-boolean v1, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->arg$2:Z

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4$$Lambda$1;->arg$3:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/messages/DialogsFragment$4;->lambda$onDialogsLoaded$0(ZLjava/util/ArrayList;)V

    return-void
.end method
