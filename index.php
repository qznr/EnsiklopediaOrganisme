<?php
// Include the connection file
include 'connection.php';

// You can now use the $conn variable to perform database operations

// Example query
$sql = "SELECT * FROM Kingdom";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Homepage</title>
    <!-- Add any other meta tags, styles, or scripts you need -->
    <link rel="stylesheet" href="css/Style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.css" integrity="sha512-1cK78a1o+ht2JcaW6g8OXYwqpev9+6GqOkz9xmBN9iUUhIndKtxwILGWYOSibOKjLsEdjyjZvYDq/cZwNeak0w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
</head>
<body>

    <div class="container">
        <nav class="navbar navbar-expand-lg">
            <div class="container">
                <a class="navbar-brand">Ensiklopedia</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="fa fa-bars"></span> Menu
                </button>
                <div class="collapse navbar-collapse" id="ftco-nav">
                    <ul class="navbar-nav ml-auto mr-md-3">
                        <li class="nav-item active"><a href="#" class="nav-link">Home</a></li>
                        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
                        <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="resourcesDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Resources
                        </a>
                        <ul class="dropdown-menu" aria-labelledby="resourcesDropdown">
                            <li><a class="dropdown-item" href="#">Resource 1</a></li>
                            <li><a class="dropdown-item" href="#">Resource 2</a></li>
                            <!-- Add more resources as needed -->
                        </ul>
                    </li>                        
                    <li class="nav-item"><a href="#" class="nav-link">FAQ</a></li>
                    </ul>
                </div>
            </div>
        </nav>
    </div>

    <section id="cover" class="d-flex align-items-center">
        <div class="container" data-aos="fade-up">
            <div class="row justify-content-center"  data-aos="fade-up" data-aos-delay="150">
                <div class="col-xl-6 col-lg-8">
                    <h1>A dedicated team to grow your company<span>.</span></h1>
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing.</p>
                </div>
                
            </div>
            <div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
                <div class="search">
                    <div class="search-form">
                        <form action="" method="post">
                            <i class="fa fa-search"></i>
                            <input type="text" name="search" placeholder="Search anything...">
                            <button class="btn btn-primary">Search</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section id="kingdom" class="d-flex">
        <div class="container">
            <div class="row justify-content-center"  data-aos="fade-up" data-aos-delay="150" style="padding-bottom: 3.75rem;">
                <div class="col-xl-6 col-lg-8">
                    <h2>Kingfom Of Life<span></span></h2>
                    <p>Lorem ipsum dolor sit amet consectetur adipiscing elit semper dalar elementum tempus hac tellus libero accumsan. </p>
                </div>
            </div>
            <div class="row justify-content-center" id="cards">
                <?php
                $sql = "SELECT * FROM Kingdom";
                $result = $conn->query($sql);

                if ($result->num_rows > 0) {
                    while ($row = $result->fetch_assoc()) {
                        echo '<div class="col-lg-4 col-md-6" data-aos="fade-up" data-aos-delay="150">';
                        echo '    <div class="card">';
                        echo '        <img src="img/Placeholder/Card-Placeholder.png">';
                        echo '        <div class="card-content">';
                        echo '            <div class="card-name">';
                        echo '                ' . $row['Nama_Kingdom'];
                        echo '            </div>';
                        echo '            <div class="card-description">';
                        echo '                ' . $row['Deskripsi_Kingdom'];
                        echo '                <a href="#" id=""><br>Learn more <i class="fa fa-arrow-right" aria-hidden="true"></i> </a>';
                        echo '            </div>';
                        echo '        </div>';
                        echo '    </div>';
                        echo '</div>';
                    }
                } else {
                    echo "No kingdoms found.";
                }
                ?>
            </div>
        </div>
    </section>


    <footer>
        <p>&copy; <?php echo date("Y"); ?> Your Website</p>
    </footer>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/aos/2.3.4/aos.js" integrity="sha512-A7AYk1fGKX6S2SsHywmPkrnzTZHrgiVT7GcQkLGDe2ev0aWb8zejytzS8wjo7PGEXKqJOrjQ4oORtnimIRZBtw==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

    <script>
    AOS.init();
    </script>

    <?php
    // Close the database connection
    $conn->close();
    ?>

</body>
</html>
