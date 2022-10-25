.class Lcom/wmspanel/libstream/n;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/wmspanel/libstream/n$a;
    }
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "RtspParser"

.field private static final da:Ljava/util/regex/Pattern;

.field private static final db:Ljava/util/regex/Pattern;


# instance fields
.field private dc:I

.field private dd:Ljava/lang/String;

.field private de:Lcom/wmspanel/libstream/n$a;

.field private df:I

.field private dg:Ljava/lang/Boolean;

.field private dh:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 19
    const-string/jumbo v0, "RTSP\\/1.0\\s+(\\d\\d\\d)\\s+(.+)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/n;->da:Ljava/util/regex/Pattern;

    .line 20
    const-string/jumbo v0, "(\\S+):\\s+(.*)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Lcom/wmspanel/libstream/n;->db:Ljava/util/regex/Pattern;

    return-void
.end method

.method constructor <init>()V
    .locals 2

    .prologue
    const/4 v1, 0x0

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 24
    sget-object v0, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    .line 25
    iput v1, p0, Lcom/wmspanel/libstream/n;->df:I

    .line 26
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/n;->dg:Ljava/lang/Boolean;

    .line 27
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lcom/wmspanel/libstream/n;->dh:Ljava/util/HashMap;

    return-void
.end method

.method private a(Ljava/lang/String;Ljava/lang/String;)V
    .locals 9

    .prologue
    const/4 v1, 0x0

    .line 97
    const-string/jumbo v0, ","

    invoke-virtual {p2, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    .line 98
    array-length v3, v2

    move v0, v1

    :goto_0
    if-ge v0, v3, :cond_2

    aget-object v4, v2, v0

    .line 99
    const-string/jumbo v5, "="

    invoke-virtual {v4, v5}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v5

    .line 100
    const/4 v6, -0x1

    if-ne v5, v6, :cond_1

    .line 98
    :cond_0
    :goto_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 104
    :cond_1
    invoke-virtual {v4, v1, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    .line 105
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v7

    if-eqz v7, :cond_0

    .line 108
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, "-"

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    .line 109
    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    .line 111
    add-int/lit8 v5, v5, 0x1

    invoke-virtual {v4, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    const-string/jumbo v5, "\""

    const-string/jumbo v7, ""

    invoke-virtual {v4, v5, v7}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    .line 112
    iget-object v5, p0, Lcom/wmspanel/libstream/n;->dh:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_1

    .line 114
    :cond_2
    return-void
.end method


# virtual methods
.method a([BIILjava/lang/StringBuilder;)I
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 117
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 119
    :goto_0
    if-ge p2, p3, :cond_2

    .line 121
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_0

    aget-byte v0, p1, p2

    const/16 v1, 0xa

    if-ne v0, v1, :cond_0

    .line 122
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->length()I

    move-result v0

    add-int/lit8 v0, v0, 0x2

    .line 132
    :goto_1
    return v0

    .line 125
    :cond_0
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 126
    aget-byte v1, p1, p2

    const/16 v2, 0xd

    if-ne v1, v2, :cond_1

    .line 127
    const/4 v0, 0x1

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 119
    :goto_2
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    .line 129
    :cond_1
    aget-byte v1, p1, p2

    int-to-char v1, v1

    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_2

    .line 132
    :cond_2
    const/4 v0, -0x1

    goto :goto_1
.end method

.method aa()Ljava/lang/Boolean;
    .locals 1

    .prologue
    .line 30
    iget-object v0, p0, Lcom/wmspanel/libstream/n;->dg:Ljava/lang/Boolean;

    return-object v0
.end method

.method ab()I
    .locals 1

    .prologue
    .line 34
    iget v0, p0, Lcom/wmspanel/libstream/n;->dc:I

    return v0
.end method

.method public b([BI)I
    .locals 6

    .prologue
    const/4 v5, 0x1

    const/4 v1, 0x0

    const/4 v2, -0x1

    .line 136
    move v0, v1

    .line 138
    :cond_0
    :goto_0
    if-lez p2, :cond_6

    .line 142
    sget-object v3, Lcom/wmspanel/libstream/n$1;->di:[I

    iget-object v4, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    invoke-virtual {v4}, Lcom/wmspanel/libstream/n$a;->ordinal()I

    move-result v4

    aget v3, v3, v4

    packed-switch v3, :pswitch_data_0

    goto :goto_0

    .line 144
    :pswitch_0
    iput v2, p0, Lcom/wmspanel/libstream/n;->dc:I

    .line 145
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/wmspanel/libstream/n;->dd:Ljava/lang/String;

    .line 146
    iget-object v3, p0, Lcom/wmspanel/libstream/n;->dh:Ljava/util/HashMap;

    invoke-virtual {v3}, Ljava/util/HashMap;->clear()V

    .line 147
    iput v1, p0, Lcom/wmspanel/libstream/n;->df:I

    .line 149
    const/4 v3, 0x4

    if-ge p2, v3, :cond_2

    move v0, v1

    .line 223
    :cond_1
    :goto_1
    return v0

    .line 151
    :cond_2
    aget-byte v3, p1, v0

    const/16 v4, 0x52

    if-ne v3, v4, :cond_1

    add-int/lit8 v3, v0, 0x1

    aget-byte v3, p1, v3

    const/16 v4, 0x54

    if-ne v3, v4, :cond_1

    add-int/lit8 v3, v0, 0x2

    aget-byte v3, p1, v3

    const/16 v4, 0x53

    if-ne v3, v4, :cond_1

    add-int/lit8 v3, v0, 0x3

    aget-byte v3, p1, v3

    const/16 v4, 0x50

    if-ne v3, v4, :cond_1

    .line 155
    sget-object v3, Lcom/wmspanel/libstream/n$a;->dk:Lcom/wmspanel/libstream/n$a;

    iput-object v3, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    goto :goto_0

    .line 162
    :pswitch_1
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 163
    invoke-virtual {p0, p1, v0, p2, v3}, Lcom/wmspanel/libstream/n;->a([BIILjava/lang/StringBuilder;)I

    move-result v4

    .line 164
    if-eq v2, v4, :cond_1

    .line 168
    add-int/2addr v0, v4

    .line 170
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/wmspanel/libstream/n;->e(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_3

    .line 171
    const-string/jumbo v0, "RtspParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unable to parse status line: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 172
    sget-object v0, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    move v0, v2

    .line 173
    goto :goto_1

    .line 175
    :cond_3
    sget-object v3, Lcom/wmspanel/libstream/n$a;->dl:Lcom/wmspanel/libstream/n$a;

    iput-object v3, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    goto/16 :goto_0

    .line 179
    :pswitch_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 180
    invoke-virtual {p0, p1, v0, p2, v3}, Lcom/wmspanel/libstream/n;->a([BIILjava/lang/StringBuilder;)I

    move-result v4

    .line 181
    if-eq v2, v4, :cond_1

    .line 185
    add-int/2addr v0, v4

    .line 187
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->length()I

    move-result v4

    if-lez v4, :cond_4

    .line 188
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {p0, v4}, Lcom/wmspanel/libstream/n;->f(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_0

    .line 189
    const-string/jumbo v0, "RtspParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "unable to parse header line: "

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 190
    sget-object v0, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    iput-object v0, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    move v0, v2

    .line 191
    goto/16 :goto_1

    .line 195
    :cond_4
    iget v3, p0, Lcom/wmspanel/libstream/n;->df:I

    if-lez v3, :cond_5

    .line 196
    sget-object v3, Lcom/wmspanel/libstream/n$a;->dm:Lcom/wmspanel/libstream/n$a;

    iput-object v3, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    goto/16 :goto_0

    .line 198
    :cond_5
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/wmspanel/libstream/n;->dg:Ljava/lang/Boolean;

    .line 199
    sget-object v1, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    iput-object v1, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    goto/16 :goto_1

    .line 206
    :pswitch_3
    iget v1, p0, Lcom/wmspanel/libstream/n;->df:I

    if-lt p2, v1, :cond_1

    .line 213
    iget v1, p0, Lcom/wmspanel/libstream/n;->df:I

    add-int/2addr v0, v1

    .line 214
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    iput-object v1, p0, Lcom/wmspanel/libstream/n;->dg:Ljava/lang/Boolean;

    .line 215
    sget-object v1, Lcom/wmspanel/libstream/n$a;->dj:Lcom/wmspanel/libstream/n$a;

    iput-object v1, p0, Lcom/wmspanel/libstream/n;->de:Lcom/wmspanel/libstream/n$a;

    goto/16 :goto_1

    :cond_6
    move v0, v1

    .line 223
    goto/16 :goto_1

    .line 142
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
    .end packed-switch
.end method

.method d(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    .prologue
    .line 38
    iget-object v0, p0, Lcom/wmspanel/libstream/n;->dh:Ljava/util/HashMap;

    invoke-virtual {p1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method e(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 5

    .prologue
    const/4 v4, 0x1

    .line 43
    sget-object v0, Lcom/wmspanel/libstream/n;->da:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 44
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_0

    .line 45
    const/4 v0, 0x0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 54
    :goto_0
    return-object v0

    .line 48
    :cond_0
    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v1

    iput v1, p0, Lcom/wmspanel/libstream/n;->dc:I

    .line 49
    const-string/jumbo v1, "RtspParser"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "status_code="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget v3, p0, Lcom/wmspanel/libstream/n;->dc:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    const/4 v1, 0x2

    invoke-virtual {v0, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/wmspanel/libstream/n;->dd:Ljava/lang/String;

    .line 52
    const-string/jumbo v0, "RtspParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "status_text="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lcom/wmspanel/libstream/n;->dd:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 54
    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0
.end method

.method f(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 6

    .prologue
    const/4 v3, 0x0

    const/4 v5, 0x1

    .line 59
    sget-object v0, Lcom/wmspanel/libstream/n;->db:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    .line 60
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v1

    if-nez v1, :cond_0

    .line 61
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    .line 93
    :goto_0
    return-object v0

    .line 64
    :cond_0
    invoke-virtual {v0, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 65
    const/4 v2, 0x2

    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 67
    const-string/jumbo v2, "Content-length"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 68
    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    iput v0, p0, Lcom/wmspanel/libstream/n;->df:I

    .line 69
    const-string/jumbo v0, "RtspParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "content_length_="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Lcom/wmspanel/libstream/n;->df:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 93
    :cond_1
    :goto_1
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto :goto_0

    .line 71
    :cond_2
    const-string/jumbo v2, "WWW-Authenticate"

    invoke-virtual {v1, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 74
    const-string/jumbo v1, " "

    invoke-virtual {v0, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v1

    .line 75
    const/4 v2, -0x1

    if-eq v2, v1, :cond_1

    .line 76
    invoke-virtual {v0, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 77
    add-int/lit8 v1, v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    .line 78
    const-string/jumbo v1, "Digest"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 79
    const-string/jumbo v1, "WWW-Authenticate-Digest"

    invoke-direct {p0, v1, v0}, Lcom/wmspanel/libstream/n;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 80
    :cond_3
    const-string/jumbo v1, "Basic"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 81
    const-string/jumbo v1, "WWW-Authenticate-Basic"

    invoke-direct {p0, v1, v0}, Lcom/wmspanel/libstream/n;->a(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    .line 83
    :cond_4
    const-string/jumbo v0, "RtspParser"

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "unsupported auth scheme="

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 84
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    goto/16 :goto_0

    .line 89
    :cond_5
    const-string/jumbo v2, "RtspParser"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string/jumbo v4, ": "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 90
    iget-object v2, p0, Lcom/wmspanel/libstream/n;->dh:Ljava/util/HashMap;

    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto/16 :goto_1
.end method
