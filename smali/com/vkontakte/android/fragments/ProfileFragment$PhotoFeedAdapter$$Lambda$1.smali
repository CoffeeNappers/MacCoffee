.class final synthetic Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)Ljava/lang/Runnable;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;)V

    return-object v0
.end method


# virtual methods
.method public run()V
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/ProfileFragment$PhotoFeedAdapter;->loadMore()V

    return-void
.end method
