.class final synthetic Lcom/patloew/rxlocation/Geocoding$$Lambda$4;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field private final arg$1:Lcom/patloew/rxlocation/Geocoding;

.field private final arg$2:Ljava/util/Locale;

.field private final arg$3:Ljava/lang/String;

.field private final arg$4:I


# direct methods
.method private constructor <init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;I)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iput-object p2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$2:Ljava/util/Locale;

    iput-object p3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$3:Ljava/lang/String;

    iput p4, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$4:I

    return-void
.end method

.method public static lambdaFactory$(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;I)Ljava/util/concurrent/Callable;
    .locals 1

    new-instance v0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;

    invoke-direct {v0, p0, p1, p2, p3}, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;-><init>(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;I)V

    return-object v0
.end method


# virtual methods
.method public call()Ljava/lang/Object;
    .locals 4

    iget-object v0, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$1:Lcom/patloew/rxlocation/Geocoding;

    iget-object v1, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$2:Ljava/util/Locale;

    iget-object v2, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$3:Ljava/lang/String;

    iget v3, p0, Lcom/patloew/rxlocation/Geocoding$$Lambda$4;->arg$4:I

    invoke-static {v0, v1, v2, v3}, Lcom/patloew/rxlocation/Geocoding;->lambda$fromLocationName$4(Lcom/patloew/rxlocation/Geocoding;Ljava/util/Locale;Ljava/lang/String;I)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method
