.class final synthetic Lcom/vkontakte/android/fragments/AudioListFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/AudioListFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/AudioListFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/AudioListFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/AudioListFragment;)Lcom/vkontakte/android/ui/SearchViewWrapper$ViewStateListener;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/AudioListFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/AudioListFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/AudioListFragment;)V

    return-object v0
.end method


# virtual methods
.method public onViewExpansionStateChanged(Z)V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/AudioListFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/AudioListFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/AudioListFragment;->access$lambda$0(Lcom/vkontakte/android/fragments/AudioListFragment;Z)V

    return-void
.end method
