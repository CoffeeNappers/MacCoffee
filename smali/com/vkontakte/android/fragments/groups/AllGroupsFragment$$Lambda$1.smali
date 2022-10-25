.class final synthetic Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;
.super Ljava/lang/Object;

# interfaces
.implements Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;


# static fields
.field private static final instance:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;

    invoke-direct {v0}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;->instance:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;

    return-void
.end method

.method private constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static lambdaFactory$()Lcom/vkontakte/android/ui/util/SearchSegmenter$Generator;
    .locals 1

    sget-object v0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;->instance:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$$Lambda$1;

    return-object v0
.end method


# virtual methods
.method public getSearchRequest(Ljava/lang/String;II)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 1
    .annotation runtime Ljava/lang/invoke/LambdaForm$Hidden;
    .end annotation

    new-instance v0, Lcom/vkontakte/android/api/groups/GroupsSearch;

    invoke-direct {v0, p1, p2, p3}, Lcom/vkontakte/android/api/groups/GroupsSearch;-><init>(Ljava/lang/String;II)V

    check-cast v0, Lcom/vkontakte/android/api/VKAPIRequest;

    return-object v0
.end method
