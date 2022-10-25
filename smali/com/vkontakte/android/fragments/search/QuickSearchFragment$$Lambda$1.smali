.class final synthetic Lcom/vkontakte/android/fragments/search/QuickSearchFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;


# instance fields
.field private final arg$1:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    return-void
.end method

.method public static lambdaFactory$(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$$Lambda$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$$Lambda$1;-><init>(Lcom/vkontakte/android/fragments/search/QuickSearchFragment;)V

    return-object v0
.end method


# virtual methods
.method public getSearchRequest(Ljava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    iget-object v0, p0, Lcom/vkontakte/android/fragments/search/QuickSearchFragment$$Lambda$1;->arg$1:Lcom/vkontakte/android/fragments/search/QuickSearchFragment;

    invoke-virtual {v0, p1, p2, p3}, Lcom/vkontakte/android/fragments/search/QuickSearchFragment;->lambda$new$0(Ljava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    return-object v0
.end method
